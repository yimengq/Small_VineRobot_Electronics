#!/usr/bin/env python3
import argparse
import struct
import time
import sys
from typing import Optional, Tuple

import serial  # pip install pyserial

# --- ISB protocol constants (doc: ISB packet overview) ---
SYNC1 = 0xEF
SYNC2 = 0x49
PKT_TYPE_ACK  = 1
PKT_TYPE_NACK = 2
PKT_TYPE_GET_DATA = 3
PKT_TYPE_DATA = 4
PKT_TYPE_SET_DATA = 5
PKT_TYPE_STOP_ALL_PORTS = 6
PKT_TYPE_STOP_DID = 7
PKT_TYPE_STOP_CUR_PORT = 8

ISB_FLAGS_NONE = 0x00
HEADER_LEN = 7  # [EF][49][TYPE][DID u16][LEN u16]
FOOTER_LEN = 2  # Fletcher-16

# DID numbers (from docs; CLTool example shows DID_PIMU==3)
DID_PIMU = 3  # pimu_t
# For GET_DATA payload, size=0 & offset=0 => whole struct
GET_DATA_PAYLOAD_FMT = "<HHHH"  # did, size, offset, periodMultiple

# pimu_t payload (binary, little-endian):
# double time; float dt; uint32 status; float[3] theta; float[3] vel
PIMU_FMT = "<d f I 3f 3f"
PIMU_SIZE = struct.calcsize(PIMU_FMT)  # 40 bytes

def fletcher16(data: bytes, seed: int = 0) -> int:
    """Fletcher-16 across entire packet (except the final 2 checksum bytes)."""
    a = (seed >> 8) & 0xFF
    b = seed & 0xFF
    for x in data:
        a = (a + x) & 0xFF
        b = (b + a) & 0xFF
    return (a << 8) | b

def build_isb_header(pkt_type: int, header_did: int, payload_len: int, flags: int = ISB_FLAGS_NONE) -> bytes:
    """ISB header: SYNC1, SYNC2, TYPE|FLAGS, DID (u16 LE), PLen (u16 LE)."""
    t = (pkt_type & 0x0F) | (flags & 0xF0)
    return struct.pack("<BBBHH", SYNC1, SYNC2, t, header_did & 0xFFFF, payload_len & 0xFFFF)

def build_get_data_packet(did: int, size: int = 0, offset: int = 0, period_mult: int = 1) -> bytes:
    """
    Build PKT_TYPE_GET_DATA packet to request streaming for a dataset.
    Payload (8 bytes): did (u16), size (u16), offset (u16), periodMultiple (u16).
    Set periodMultiple=0 for a single (non-streaming) response.
    """
    payload = struct.pack(GET_DATA_PAYLOAD_FMT, did & 0xFFFF, size & 0xFFFF, offset & 0xFFFF, period_mult & 0xFFFF)
    header = build_isb_header(PKT_TYPE_GET_DATA, 0, len(payload), ISB_FLAGS_NONE)
    ck = fletcher16(header + payload)
    return header + payload + struct.pack("<H", ck)

def build_stop_all_ports_packet() -> bytes:
    # The docs give an exact hex example. We just recreate it programmatically so it's easy to see.
    header = build_isb_header(PKT_TYPE_STOP_ALL_PORTS, 0, 0, ISB_FLAGS_NONE)
    ck = fletcher16(header)
    return header + struct.pack("<H", ck)

def parse_packet(buf: bytearray) -> Optional[Tuple[int,int,bytes,int]]:
    """
    Find and parse one complete ISB packet from the buffer.
    Returns (pkt_type, header_did, payload_bytes, total_len), or None if incomplete.
    Drops garbage before a valid sync pair.
    """
    # Search for sync
    i = 0
    while True:
        j = buf.find(bytes([SYNC1]), i)
        if j < 0 or j + 1 >= len(buf):
            # not enough data yet
            # drop before i
            if i > 0:
                del buf[:i]
            return None
        if buf[j+1] == SYNC2:
            # candidate header start at j
            if len(buf) - j < HEADER_LEN:
                # need more bytes for full header
                if j > 0:
                    del buf[:j]
                return None
            # Unpack header
            _, _, type_flags, header_did, payload_len = struct.unpack_from("<BBBH H", buf, j)
            pkt_type = type_flags & 0x0F
            flags = type_flags & 0xF0
            total_len = HEADER_LEN + payload_len + FOOTER_LEN
            if len(buf) - j < total_len:
                # need more bytes
                if j > 0:
                    del buf[:j]
                return None
            # Verify checksum
            body = bytes(buf[j : j + HEADER_LEN + payload_len])
            rx_ck, = struct.unpack_from("<H", buf, j + HEADER_LEN + payload_len)
            calc_ck = fletcher16(body)
            if rx_ck == calc_ck:
                payload = body[HEADER_LEN:]
                # Trim buffer up to end of this packet
                del buf[: j + total_len]
                return pkt_type, header_did, payload, total_len
            else:
                # bad sync or corrupt; skip this SYNC and keep scanning
                i = j + 1
                continue
        else:
            i = j + 1

def unpack_pimu(payload: bytes):
    if len(payload) < PIMU_SIZE:
        return None
    return struct.unpack(PIMU_FMT, payload[:PIMU_SIZE])

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", default="/dev/ttyS5", help="Serial device (default /dev/ttyS5)")
    ap.add_argument("--baud", default=115200, type=int, help="Baud rate (default 115200)")
    ap.add_argument("--no-get", action="store_true", help="Do not send GET_DATA; just listen (useful if streaming is already enabled)")
    ap.add_argument("--period", default=1, type=int, help="Period multiple for GET_DATA (PIMU should be 1)")
    args = ap.parse_args()

    ser = serial.Serial(args.port, args.baud, timeout=0.05)
    print(f"Opened {ser.port} @ {args.baud} 8N1")

    # Recommended: stop broadcasts first (protocol-agnostic)
    # Docs also give this exact hex; we build it so checksum stays correct. :contentReference[oaicite:2]{index=2}
    stop_pkt = build_stop_all_ports_packet()
    ser.write(stop_pkt)
    ser.flush()
    time.sleep(0.05)

    if not args.no_get:
        # Request DID_PIMU streaming (period multiple 1). For PIMU, the output rate follows startupNavDtMs. :contentReference[oaicite:3]{index=3}
        get_pkt = build_get_data_packet(DID_PIMU, size=0, offset=0, period_mult=args.period)
        ser.write(get_pkt)
        ser.flush()
        print("Sent GET_DATA request for DID_PIMU")

    rx = bytearray()
    last_print = time.time()
    print("Listening for PKT_TYPE_DATA… (Ctrl+C to quit)\n")

    try:
        while True:
            data = ser.read(4096)
            if data:
                rx.extend(data)
                while True:
                    parsed = parse_packet(rx)
                    if not parsed:
                        break
                    pkt_type, header_did, payload, _ = parsed

                    if pkt_type == PKT_TYPE_DATA and header_did == DID_PIMU:
                        p = unpack_pimu(payload)
                        if p is None:
                            continue
                        t, dt, status, thx, thy, thz, vx, vy, vz = p
                        # IMU = PIMU / dt (for gyro/accel averages over the integration window). :contentReference[oaicite:4]{index=4}
                        # Here we just print the PIMU directly.
                        print(f"t={t:10.3f}s  dt={dt:.6f}s  status=0x{status:08X}  "
                              f"theta(rad)=[{thx:+.6f},{thy:+.6f},{thz:+.6f}]  "
                              f"vel(m/s)=[{vx:+.6f},{vy:+.6f},{vz:+.6f}]")

                    elif pkt_type == PKT_TYPE_ACK:
                        print("ACK")
                    elif pkt_type == PKT_TYPE_NACK:
                        print("NACK")
                    # else ignore other DIDs or packet types
            else:
                # heartbeat print every ~5s so you know we’re alive
                if time.time() - last_print > 5:
                    print(".", end="", flush=True)
                    last_print = time.time()
    except KeyboardInterrupt:
        pass
    finally:
        # optional: send stop on exit
        try:
            ser.write(build_stop_all_ports_packet())
        except Exception:
            pass
        ser.close()

if __name__ == "__main__":
    main()
