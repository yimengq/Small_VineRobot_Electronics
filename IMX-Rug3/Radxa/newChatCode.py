# #!/usr/bin/env python3
# """
# imu_start.py — Minimal starter to kick the IMU using the exact two frames from your logic capture.

# - UART: /dev/ttyS5 @ 115200 8N1
# - Initial idle delay (default 230 µs) before the first frame
# - Sends:
#     FRAME1: ef 49 06 00 00 00 00 3e 1f
#     FRAME2: ef 49 03 00 00 08 00 03 00 00 00 28 00 00 32 00 a0 a7
# - Optional repeat with a configurable gap
# """

# import argparse, time, binascii
# import serial

# # --- Bytes exactly as seen in your analyzer capture (checksums included) ---
# FRAME1 = bytes.fromhex("ef4906000000003e1fef49030008000300280000003200a0a7")
# #FRAME2 = bytes.fromhex("000")

# def hexstr(b: bytes) -> str:
#     return binascii.hexlify(b).decode()

# def main():
#     ap = argparse.ArgumentParser()
#     ap.add_argument("--port", default="/dev/ttyS5", help="Serial device (default: /dev/ttyS5)")
#     ap.add_argument("--baud", type=int, default=115200, help="Baud rate (default: 115200)")
#     ap.add_argument("--idle-us", type=int, default=0, help="Initial idle delay before 1st frame (µs)")
#     ap.add_argument("--gap-ms", type=float, default=0.0, help="Gap between frames (ms)")
#     ap.add_argument("--repeat", type=int, default=1, help="Number of times to send the 2-frame sequence")
#     ap.add_argument("--rx-timeout", type=float, default=3, help="Read timeout for reply (seconds)")
#     ap.add_argument("--rx-bytes", type=int, default=256, help="Bytes to read after sending (per sequence)")
#     args = ap.parse_args()

#     ser = serial.Serial(
#         args.port, args.baud, timeout=args.rx_timeout,
#         bytesize=serial.EIGHTBITS, parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE,
#         xonxoff=False, rtscts=False, dsrdtr=False
#     )
#     # Many UARTs are happier with DTR/RTS asserted; harmless if unsupported.
#     try:
#         ser.dtr = True
#         ser.rts = True
#     except Exception:
#         pass

#     print(f"Opened {ser.port} @ {args.baud} 8N1")

#     for i in range(args.repeat):
#         # Initial idle high (UART idles high anyway; this just reproduces your ~230 µs gap)
#         if args.idle_us > 0:
#             time.sleep(args.idle_us / 1_000_000.0)

#         # FRAME 1
#         print(f"TX[{i+1}] FRAME1: {hexstr(FRAME1)}")
#         ser.write(FRAME1); ser.flush()

#         # Inter-frame gap (match your capture timing if you like)
#         if args.gap_ms > 0:
#             time.sleep(args.gap_ms / 1000.0)

#         # # FRAME 2
#         # print(f"TX[{i+1}] FRAME2: {hexstr(FRAME2)}")
#         # ser.write(FRAME2); ser.flush()

#         # Optional: read immediate response
#         rx = ser.read(args.rx_bytes)
#         if rx:
#             print(f"RX[{i+1}] {len(rx)} bytes: {hexstr(rx)}")
#         else:
#             print(f"RX[{i+1}] (no data within {args.rx_timeout}s)")

#     ser.close()

# if __name__ == "__main__":
#     main()

#ABOVE IS WORKING CODE


#!/usr/bin/env python3
# """
# read_is_serial.py

# Startup:
#   Sends FRAME1 = ef4906000000003e1fef49030008000300280000003200a0a7

# Then listens for packets and decodes PIMU messages (DID=3).
# """

# import argparse, sys, time, binascii, struct
# import serial

# # --- Startup frame ---
# FRAME1 = bytes.fromhex("ef4906000000003e1fef49030008000300280000003200a0a7")

# # --- Protocol constants ---
# SYNC1, SYNC2 = 0xEF, 0x49
# HEADER_LEN   = 7
# FOOTER_LEN   = 2
# PKT_TYPE_DATA = 0x04
# DID_PIMU  = 3

# DATA_HDR_FMT  = "<HHH"
# DATA_HDR_SIZE = struct.calcsize(DATA_HDR_FMT)
# PIMU_FMT  = "<d f I 3f 3f"
# PIMU_SIZE = struct.calcsize(PIMU_FMT)

# def hexstr(b: bytes) -> str:
#     return binascii.hexlify(b).decode()

# def hexdump(buf: bytes, width: int = 16) -> str:
#     lines = []
#     for off in range(0, len(buf), width):
#         chunk = buf[off:off+width]
#         hexpart = " ".join(f"{x:02x}" for x in chunk)
#         asciip  = "".join(chr(x) if 32 <= x < 127 else "." for x in chunk)
#         lines.append(f"{off:08x}  {hexpart:<{width*3}}  {asciip}")
#     return "\n".join(lines)

# def fletcher16(data: bytes) -> int:
#     """(c<<8)|a variant (try --fletcher ac for other)"""
#     a = 0; c = 0
#     for x in data:
#         a = (a + x) & 0xFF
#         c = (c + a) & 0xFF
#     return (c << 8) | a

# def parse_one(buf: bytearray) -> tuple | None:
#     i = 0
#     while True:
#         j = -1
#         for k in range(i, len(buf)-1):
#             if buf[k] == SYNC1 and buf[k+1] == SYNC2:
#                 j = k
#                 break
#         if j < 0:
#             if i: del buf[:i]
#             return None
#         if len(buf) - j < HEADER_LEN:
#             if j: del buf[:j]
#             return None
#         try:
#             _, _, type_flags, outer_did, plen = struct.unpack_from("<BBBH H", buf, j)
#         except struct.error:
#             if j: del buf[:j]
#             return None
#         total = HEADER_LEN + plen + FOOTER_LEN
#         if len(buf) - j < total:
#             if j: del buf[:j]
#             return None
#         body = bytes(buf[j : j + HEADER_LEN + plen])
#         rx_ck, = struct.unpack_from("<H", buf, j + HEADER_LEN + plen)
#         calc  = fletcher16(body)
#         if rx_ck != calc:
#             i = j + 1
#             continue
#         payload  = body[HEADER_LEN:]
#         pkt_type = type_flags & 0x0F
#         full  = body + struct.pack("<H", rx_ck)
#         del buf[: j + total]
#         return pkt_type, outer_did, payload, full

# def main():
#     ap = argparse.ArgumentParser()
#     ap.add_argument("--port", default="/dev/ttyS5")
#     ap.add_argument("--baud", type=int, default=115200)
#     ap.add_argument("--timeout", type=float, default=0.2)
#     ap.add_argument("--rx-chunk", type=int, default=1024)
#     ap.add_argument("--hexdump", action="store_true")
#     ap.add_argument("--rawtap", action="store_true")
#     ap.add_argument("--no-rtsdtr", action="store_true")
#     ap.add_argument("--repeat", type=int, default=1, help="Repeat FRAME1 this many times")
#     args = ap.parse_args()

#     ser = serial.Serial(
#         args.port, args.baud, timeout=args.timeout,
#         bytesize=serial.EIGHTBITS, parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE,
#         xonxoff=False, rtscts=False, dsrdtr=False
#     )
#     try:
#         ser.dtr = False; ser.rts = False
#     except Exception:
#         pass

#     print(f"Opened {ser.port} @ {args.baud} 8N1")

#     # --- Send FRAME1 at startup ---
#     for i in range(args.repeat):
#         print(f"TX[{i+1}] FRAME1: {hexstr(FRAME1)}")
#         ser.write(FRAME1); ser.flush()
#         time.sleep(0.05)

#     # --- Listen loop ---
#     rxbuf = bytearray()
#     last_tick = time.time()
#     try:
#         while True:
#             chunk = ser.read(args.rx_chunk)
#             if chunk:
#                 if args.rawtap:
#                     print(f"RAW +{len(chunk)}: {hexstr(chunk)}")
#                 rxbuf.extend(chunk)
#                 while True:
#                     pkt = parse_one(rxbuf)
#                     if not pkt:
#                         break
#                     pkt_type, outer_did, payload, full = pkt
#                     if args.hexdump:
#                         print("\n— RX PACKET —")
#                         print(hexdump(full))
#                     print(f"Packet: type=0x{pkt_type:02x}, outer_did={outer_did}, payload_len={len(payload)}")
#                     if pkt_type == PKT_TYPE_DATA and len(payload) >= DATA_HDR_SIZE:
#                         did, size, offset = struct.unpack_from(DATA_HDR_FMT, payload, 0)
#                         body = payload[DATA_HDR_SIZE:]
#                         if did == DID_PIMU and len(body) >= PIMU_SIZE:
#                             t, dt, status, thx, thy, thz, vx, vy, vz = struct.unpack_from(PIMU_FMT, body, 0)
#                             print(
#                                 f"time={t:.3f}s dt={dt:.6f}s status=0x{status:08x} "
#                                 f"theta=({thx:.6f}, {thy:.6f}, {thz:.6f}) "
#                                 f"vel=({vx:.6f}, {vy:.6f}, {vz:.6f})"
#                             )
#             else:
#                 if time.time() - last_tick > 5:
#                     print(".", end="", flush=True)
#                     last_tick = time.time()
#     except KeyboardInterrupt:
#         pass
#     finally:
#         ser.close()

# if __name__ == "__main__":
#     main()


# rx_header_probe.py
import serial, argparse, struct, binascii, time
def hexstr(b): return binascii.hexlify(b).decode()
def fletcher_ac(data: bytes) -> int:
    a=c=0
    for x in data: a=(a+x)&0xFF; c=(c+a)&0xFF
    return (a<<8)|c
def fletcher_ca(data: bytes) -> int:
    a=c=0
    for x in data: a=(a+x)&0xFF; c=(c+a)&0xFF
    return (c<<8)|a

ap = argparse.ArgumentParser()
ap.add_argument("--port", default="/dev/ttyS5")
ap.add_argument("--baud", type=int, default=115200)
ap.add_argument("--chunk", type=int, default=1024)
ap.add_argument("--max", type=int, default=200000, help="Max bytes to scan before exiting")
ap.add_argument("--also", action="store_true", help="Also scan for ASCII 'I>' sync")
args = ap.parse_args()

ser = serial.Serial(args.port, args.baud, timeout=0.2)
try:
    ser.dtr=False; ser.rts=False
except Exception: pass
print(f"Scanning {ser.port} @ {args.baud} … Ctrl+C to stop")
buf = bytearray()
count = 0
HEADER_LEN=7
FOOTER_LEN=2
sync_list=[(0xEF,0x49)]
if args.also: sync_list.append((ord('I'),ord('>')))

try:
    while len(buf) < args.max:
        chunk = ser.read(args.chunk)
        if not chunk: 
            print(".", end="", flush=True); continue
        buf.extend(chunk)
        i=0
        while i+1 < len(buf):
            if (buf[i],buf[i+1]) in sync_list:
                j=i
                if len(buf)-j < HEADER_LEN: break
                # raw header fields (little-endian for type|flags + outer_did)
                try:
                    _,_, type_flags, outer_did_le, plen_le = struct.unpack_from("<BBBH H", buf, j)
                except Exception:
                    i += 1; continue
                # also compute big-endian length interpretation
                plen_be = int.from_bytes(buf[j+5:j+7], "big")
                # decide total sizes
                total_le = HEADER_LEN + plen_le + FOOTER_LEN
                total_be = HEADER_LEN + plen_be + FOOTER_LEN
                # read checksum if available
                ck_le = ck_be = None
                ok_le_ac = ok_le_ca = ok_be_ac = ok_be_ca = False
                if len(buf)-j >= total_le:
                    body_le = bytes(buf[j:j+HEADER_LEN+plen_le])
                    ck_le = int.from_bytes(buf[j+HEADER_LEN+plen_le:j+HEADER_LEN+plen_le+2], "little")
                    ok_le_ac = (fletcher_ac(body_le)==ck_le)
                    ok_le_ca = (fletcher_ca(body_le)==ck_le)
                if len(buf)-j >= total_be and plen_be!=plen_le:
                    body_be = bytes(buf[j:j+HEADER_LEN+plen_be])
                    ck_be = int.from_bytes(buf[j+HEADER_LEN+plen_be:j+HEADER_LEN+plen_be+2], "little")
                    ok_be_ac = (fletcher_ac(body_be)==ck_be)
                    ok_be_ca = (fletcher_ca(body_be)==ck_be)
                print(f"\n@{j}: sync={buf[j]:02x}{buf[j+1]:02x} type=0x{type_flags:02x} outer_did(le)={outer_did_le} "
                      f"plen(le)={plen_le} plen(be)={plen_be} "
                      f"CRC(le):{ck_le} ok(ac)={ok_le_ac} ok(ca)={ok_le_ca} "
                      f"CRC(be):{ck_be} ok(ac)={ok_be_ac} ok(ca)={ok_be_ca}")
                # advance
                i = j+1
            else:
                i += 1
        # trim buffer to keep it bounded
        if len(buf) > 20000:
            del buf[:15000]
except KeyboardInterrupt:
    pass
finally:
    ser.close()