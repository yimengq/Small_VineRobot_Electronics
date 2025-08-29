# #!/usr/bin/env python3
# import time
# import spidev  # pip install spidev

# SPI_BUS  = 3          # /dev/spidev3.0
# SPI_DEV  = 0
# SPI_MODE = 3          # Mode 3 (CPOL=1, CPHA=1) per IMX docs
# SPI_HZ   = 200_000    # start slower to be safe; bump after it works
# PAD_BYTES = 256
# PERIOD_S  = 0.050     # ~20 Hz

# # The 16-byte frame to send every query
# QUERY_FRAME = [
#     0xEF, 0x49, 0x03, 0x00, 0x08, 0x00, 0x03, 0x00,
#     0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6E, 0x43
# ]

# def hexdump_row(buf, limit=32):
#     return " ".join(f"{b:02X}" for b in buf[:limit])

# def query_once(spi):
#     # build one contiguous buffer so CS stays LOW for the whole transaction
#     tx = bytearray(QUERY_FRAME + [0xFF]*PAD_BYTES)
#     # perform one transfer
#     rx = spi.xfer2(list(tx))   # spidev accepts list or bytearray; list is universally safe
#     return bytes(rx)

# def main():
#     spi = spidev.SpiDev()
#     try:
#         spi.open(SPI_BUS, SPI_DEV)   # requires root or proper udev rules
#         spi.mode = SPI_MODE
#         spi.max_speed_hz = SPI_HZ
#         spi.bits_per_word = 8
#         # ensure kernel controls CS (default); DO NOT set spi.no_cs = True

#         print(f"Opened /dev/spidev{SPI_BUS}.{SPI_DEV}  mode={spi.mode}  hz={spi.max_speed_hz}")
#         print("[TX every query] " + hexdump_row(bytes(QUERY_FRAME), limit=999))

#         # first query (full dump)
#         rx0 = query_once(spi)
#         print("[RX first] " + hexdump_row(rx0, limit=64))

#         # periodic loop
#         while True:
#             t0 = time.time()
#             rx = query_once(spi)
#             print("[RX] " + hexdump_row(rx, limit=32) + " ...")
#             dt = time.time() - t0
#             if dt < PERIOD_S:
#                 time.sleep(PERIOD_S - dt)

#     except Exception as e:
#         print("SPI transfer failed:", repr(e))
#         print("\nQuick fixes to try:")
#         print("  1) Run with sudo (permissions):  sudo python3 SPI_IMU.py")
#         print("  2) Verify device exists:         ls -l /dev/spidev3.0")
#         print("  3) Slow down further:            set SPI_HZ = 100_000")
#         print("  4) Confirm Mode 3 wiring & nSPI_EN held LOW at power-on")
#     finally:
#         try: spi.close()
#         except: pass

# if __name__ == "__main__":
#     main()

# !/usr/bin/env python3
# !/usr/bin/env python3
# import time
# import struct
# import spidev

# # ---------- SPI config (Radxa Zero 3W) ----------
# SPI_BUS  = 3                 # /dev/spidev3.0
# SPI_DEV  = 0
# SPI_MODE = 3                 # Mode 3 (CPOL=1, CPHA=1)
# SPI_HZ   = 1_000_000         # Start at 1 MHz; raise if stable

# # ---------- Query cadence ----------
# QUERY_PERIOD_S = 0.005       # 5 ms (~200 Hz). Tweak as needed.

# # ---------- TX frames ----------
# QUERY_FRAME = bytes([
#     0xEF, 0x49, 0x03, 0x00, 0x08, 0x00, 0x03, 0x00,
#     0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6E, 0x43
# ])
# PAD_BYTES = 256              # Enough clock to pull a full reply

# # ---------- ISComm bits ----------
# # Accept either preamble: 0x77 0xA4 (your request) or legacy 0xEF 0x49
# SYNC_CANDIDATES = [(0x77, 0xA4), (0xEF, 0x49)]
# PKT_TYPE_DATA   = 0x04
# DID_PIMU        = 3

# # Header inside DATA body: p_data_hdr_t = <B H H  (id: u8, size: u16, offset: u16)
# HDR_FMT  = "<BHH"
# HDR_SIZE = struct.calcsize(HDR_FMT)

# # PIMU payload layout: double time; float dt; uint32 status; float theta[3]; float vel[3]
# PIMU_FMT  = "<d f I 3f 3f"
# PIMU_SIZE = struct.calcsize(PIMU_FMT)   # 40 bytes

# def hexd(s: bytes, n=64):
#     return " ".join(f"{b:02X}" for b in s[:n])

# def find_sync(buf: bytearray, start: int) -> int:
#     """Return index of the next sync (0x77 A4 preferred), or -1 if none."""
#     n = len(buf)
#     i = start
#     while i + 1 < n:
#         b0 = buf[i]
#         b1 = buf[i+1]
#         # prefer 0x77 0xA4
#         if (b0, b1) == SYNC_CANDIDATES[0]:
#             return i
#         # accept 0xEF 0x49 as fallback
#         if (b0, b1) == SYNC_CANDIDATES[1]:
#             return i
#         i += 1
#     return -1

# def parse_stream(buf: bytearray):
#     """
#     Scan 'buf' for DATA packets:
#       [SYNC0][SYNC1][pktType][flags?] ... [p_data_hdr_t (id,u16 size,u16 off)] [payload(size)]
#     We don't rely on full outer length here; we look for a plausible p_data_hdr_t immediately
#     after 2 bytes of sync + 2 bytes (pktType + flags).
#     """
#     out = []
#     i = 0
#     while True:
#         i = find_sync(buf, i)
#         if i < 0:
#             break
#         # Need at least: SYNC(2) + pktType(1) + flags(1) + p_data_hdr_t(5) + 1 byte payload
#         if i + 2 + 1 + 1 + HDR_SIZE >= len(buf):
#             # need more data next time
#             break
#         pkt_type = buf[i+2]
#         # flags = buf[i+3]  # not used here

#         if pkt_type != PKT_TYPE_DATA:
#             i += 1
#             continue

#         hdr_off = i + 4
#         try:
#             did, size, offset = struct.unpack_from(HDR_FMT, buf, hdr_off)
#         except struct.error:
#             i += 1
#             continue

#         # sanity checks
#         if size == 0 or size > 4096:
#             i += 1
#             continue

#         payload_off = hdr_off + HDR_SIZE
#         end_needed  = payload_off + size
#         if end_needed > len(buf):
#             # wait for more bytes
#             break

#         payload = bytes(buf[payload_off:end_needed])
#         out.append((did, payload))

#         # advance to end of this payload and keep scanning
#         i = end_needed
#     # trim consumed data from the left
#     if i > 0:
#         del buf[:i]
#     return out

# def unpack_pimu(payload: bytes):
#     if len(payload) < PIMU_SIZE:
#         return None
#     t, dt, status, th0, th1, th2, v0, v1, v2 = struct.unpack_from(PIMU_FMT, payload, 0)
#     return {
#         "time": t,
#         "dt": dt,
#         "status": status,
#         "theta": (th0, th1, th2),
#         "vel":   (v0, v1, v2),
#     }

# def main():
#     spi = spidev.SpiDev()
#     spi.open(SPI_BUS, SPI_DEV)
#     spi.mode = SPI_MODE
#     spi.max_speed_hz = SPI_HZ
#     spi.bits_per_word = 8

#     print(f"Opened /dev/spidev{SPI_BUS}.{SPI_DEV}  mode={spi.mode}  hz={spi.max_speed_hz}")
#     print("Scanning for sync bytes 0x77 0xA4 (fallback 0xEF 0x49).")
#     print("[TX frame] ", hexd(QUERY_FRAME, 999))

#     rxbuf = bytearray()
#     tx_one = bytearray(QUERY_FRAME + bytes([0xFF])*PAD_BYTES)

#     # First query
#     rx0 = spi.xfer2(list(tx_one))    # single burst so CS stays low
#     rxbuf.extend(rx0)

#     for did, payload in parse_stream(rxbuf):
#         if did == DID_PIMU:
#             p = unpack_pimu(payload)
#             if p:
#                 print(f"PIMU t={p['time']:.3f}s dt={p['dt']:.6f}s "
#                       f"theta=[{p['theta'][0]:+.6f} {p['theta'][1]:+.6f} {p['theta'][2]:+.6f}] "
#                       f"vel=[{p['vel'][0]:+.6f} {p['vel'][1]:+.6f} {p['vel'][2]:+.6f}]")

#     # periodic loop at high rate
#     try:
#         period = QUERY_PERIOD_S
#         while True:
#             t0 = time.time()
#             rx = spi.xfer2(list(tx_one))
#             rxbuf.extend(rx)

#             for did, payload in parse_stream(rxbuf):
#                 if did == DID_PIMU:
#                     p = unpack_pimu(payload)
#                     if p:
#                         print(f"PIMU t={p['time']:.3f}s dt={p['dt']:.6f}s "
#                               f"theta=[{p['theta'][0]:+.6f} {p['theta'][1]:+.6f} {p['theta'][2]:+.6f}] "
#                               f"vel=[{p['vel'][0]:+.6f} {p['vel'][1]:+.6f} {p['vel'][2]:+.6f}]")

#             elapsed = time.time() - t0
#             if elapsed < period:
#                 time.sleep(period - elapsed)
#     except KeyboardInterrupt:
#         pass
#     finally:
#         spi.close()

# if __name__ == "__main__":
#     main()

#!/usr/bin/env python3
import time, struct
import spidev

# ================= Config =================
SPI_BUS, SPI_DEV = 3, 0
SPI_MODE = 3
SPI_HZ   = 1_000_000
PAD_BYTES = 256

INIT_FRAME = [
    0xEF,0x49,0x03,0x00,0x08,0x00,0x03,0x00,
    0x28,0x00,0x00,0x00,0x00,0x00,0x6E,0x43
]
QUERY_FRAME = bytes(INIT_FRAME)

SYNC0, SYNC1  = 0xEF, 0x49
PKT_TYPE_DATA = 0x04
DID_PIMU      = 0x03

# pimu_t: double (8) + float (4) + uint32 (4) + 3f (12) + 3f (12) = 40
PIMU_FMT  = "<d f I 3f 3f"
PIMU_SIZE = struct.calcsize(PIMU_FMT)  # 40
# ================= Helpers =================
def to_bytes(x):
    if isinstance(x, (bytes, bytearray)):
        return bytes(x)
    if isinstance(x, list):
        return bytes(x)
    # allow memoryview etc.
    return bytes(bytearray(x))

def hexd(b, maxlen=64):
    return " ".join(f"{x:02X}" for x in b[:maxlen]) + (" ..." if len(b) > maxlen else "")

def parse_pimu(payload):
    payload = to_bytes(payload)
    if len(payload) < 40:
        return None
    # time: double (8), dt: float (4), status: uint32 (4), theta[3]: 3*float, vel[3]: 3*float  => 40 bytes
    t, = struct.unpack_from("<d", payload, 0)
    dt, = struct.unpack_from("<f", payload, 8)
    status, = struct.unpack_from("<I", payload, 12)
    th0, th1, th2 = struct.unpack_from("<3f", payload, 16)
    v0,  v1,  v2  = struct.unpack_from("<3f", payload, 28)
    return {
        "time": t, "dt": dt, "status": status,
        "theta": (th0, th1, th2),
        "vel":   (v0, v1, v2),
    }

def scan_and_decode(rx_bytes: bytes):
    """
    Find EF 49 04 <did:1> <size:2> <payload:size>
    Decode DID_PIMU payload with an 8-byte double first.
    """
    i, n = 0, len(rx_bytes)
    while i + 5 <= n:
        if rx_bytes[i] != SYNC0 or rx_bytes[i+1] != SYNC1:
            i += 1
            continue
        if rx_bytes[i+2] != PKT_TYPE_DATA:
            i += 1
            continue

        did   = rx_bytes[i+3]
        size  = rx_bytes[i+4] | (rx_bytes[i+5] << 8)
        start = i + 6
        end   = start + size
        if end > n:
            break  # wait for more bytes

        payload = rx_bytes[start:end]

        # Debug prints
        print(f"[PKT] did={did} size={size}")
        print("[PIMU raw]", " ".join(f"{b:02X}" for b in payload))

        if did == DID_PIMU and size == PIMU_SIZE:
            p = parse_pimu(payload)
            if p:
                print(
                    f"[PIMU decode] t={p['time']:.6f}s dt={p['dt']:.6f}s "
                    f"theta=[{p['theta'][0]:+.6f} {p['theta'][1]:+.6f} {p['theta'][2]:+.6f}] "
                    f"vel=[{p['vel'][0]:+.6f} {p['vel'][1]:+.6f} {p['vel'][2]:+.6f}] "
                    f"status=0x{p['status']:08X}"
                )

        i = end  # move to next packet

# ================= Main =================
def main():
    spi = spidev.SpiDev()
    spi.open(SPI_BUS, SPI_DEV)
    spi.mode = SPI_MODE
    spi.max_speed_hz = SPI_HZ
    spi.lsbfirst = False
    spi.bits_per_word = 8

    init_burst  = bytearray(INIT_FRAME + [0x00]*PAD_BYTES)
    query_burst = bytearray(QUERY_FRAME + bytes([0x00]*PAD_BYTES))

    # Send init once
    rx_init = spi.xfer2(list(init_burst))
    print(f"[INIT TX] {hexd(init_burst)}")
    print(f"[INIT RX] {hexd(rx_init)}")
    scan_and_decode(rx_init)

    # Main loop
    try:
        while True:
            rx = spi.xfer2(list(query_burst))
            print(f"[TX] {hexd(query_burst)}")
            print(f"[RX] {hexd(rx)}")
            scan_and_decode(rx)
            time.sleep(0.1)
    except KeyboardInterrupt:
        pass
    finally:
        spi.close()
        print("Closed SPI device.")

if __name__ == "__main__":
    main()