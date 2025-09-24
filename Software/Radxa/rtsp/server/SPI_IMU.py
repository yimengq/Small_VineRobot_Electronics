#!/usr/bin/env python3
import time, struct
import spidev
import numpy as np

# ================= Config =================
SPI_BUS, SPI_DEV = 3, 0
SPI_MODE = 3
SPI_HZ   = 1_000_000
PAD_BYTES = 256

# --- NEW: payload interpretation toggles ---
# Some firmware variants send [time, dt, status, 3f, 3f] with the 3f blocks swapped.
FLIP_THETA_VEL = True       # True => payload order is [Δv][Δθ]; False => [Δθ][Δv]
THETA_SCALE    = (180/np.pi)*1e1       # 1e-3 if Δθ is in milliradians; 1.0 if already in radians
VEL_SCALE      = 1.0        # keep Δv as-is (m/s); change if yours is scaled
# -------------------------------------------


# Data-ready (or any line you want to pulse low)
DRIVE_LOW_CHIP = "/dev/gpiochip3"  # GPIO3
DRIVE_LOW_LINE = 17                # GPIO3_C1 -> 16+1 = 17
DRIVE_LOW_MS   = 1                 # how long to hold low

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
    return bytes(bytearray(x))

def hexd(b, maxlen=64):
    return " ".join(f"{x:02X}" for x in b[:maxlen]) + (" ..." if len(b) > maxlen else "")

def parse_pimu(payload):
    payload = to_bytes(payload)
    if len(payload) < 40:
        return None
    # header
    t,     = struct.unpack_from("<d", payload, 0)
    dt,    = struct.unpack_from("<f", payload, 8)
    status,= struct.unpack_from("<I", payload, 12)

    # raw blocks straight from wire
    b0 = struct.unpack_from("<3f", payload, 16)
    b1 = struct.unpack_from("<3f", payload, 28)

    # interpret according to toggles
    if FLIP_THETA_VEL:
        dv_raw   = b0
        dth_raw  = b1
    else:
        dth_raw  = b0
        dv_raw   = b1

    # apply unit/scale
    dtheta = tuple(x * THETA_SCALE for x in dth_raw)  # -> radians
    dvel   = tuple(x * VEL_SCALE   for x in dv_raw)   # -> m/s

    return {
        "time": t, "dt": dt, "status": status,
        "theta": dtheta,    # Δθ (rad)
        "vel":   dvel,      # Δv (m/s)
        "_raw":  {"b0": b0, "b1": b1}  # keep for debugging
    }



# def parse_pimu(payload):
#     payload = to_bytes(payload)
#     if len(payload) < 40:
#         return None
#     t, = struct.unpack_from("<d", payload, 0)
#     dt, = struct.unpack_from("<f", payload, 8)
#     status, = struct.unpack_from("<I", payload, 12)
#     th0, th1, th2 = struct.unpack_from("<3f", payload, 16)
#     v0,  v1,  v2  = struct.unpack_from("<3f", payload, 28)
#     return {"time": t, "dt": dt, "status": status, "theta": (th0, th1, th2), "vel": (v0, v1, v2)}

# def scan_and_decode(rx_bytes: bytes):
#     i, n = 0, len(rx_bytes)
#     while i + 5 <= n:
#         if rx_bytes[i] != SYNC0 or rx_bytes[i+1] != SYNC1:
#             i += 1; continue
#         if rx_bytes[i+2] != PKT_TYPE_DATA:
#             i += 1; continue
#         did   = rx_bytes[i+3]
#         size  = rx_bytes[i+4] | (rx_bytes[i+5] << 8)
#         start = i + 6
#         end   = start + size
#         if end > n: break
#         payload = rx_bytes[start:end]
#         if did == DID_PIMU and size == PIMU_SIZE:
#             p = parse_pimu(payload)
#             if p:
#                 print(
#                     f"[PIMU decode] t={p['time']:.6f}s dt={p['dt']:.6f}s "
#                     f"theta=[{p['theta'][0]:+.6f} {p['theta'][1]:+.6f} {p['theta'][2]:+.6f}] "
#                     f"vel=[{p['vel'][0]:+.6f} {p['vel'][1]:+.6f} {p['vel'][2]:+.6f}] "
#                     f"status=0x{p['status']:08X}"
#                 )
#         i = end

# --- put near the top (module scope) ---
_carry = bytearray()  # keep tail bytes between calls
HEADER_LEN = 6        # EF 49 <type> <did> <size_lo> <size_hi>

def scan_and_decode(rx_bytes: bytes):
    """
    Feed raw bytes; extracts complete frames and prints PIMU ones.
    Keeps incomplete tail for next call to avoid IndexError & frame loss.
    """
    global _carry

    # concat with any leftover from previous call
    buf = _carry + bytearray(rx_bytes)
    n = len(buf)
    i = 0

    while True:
        # Need at least a full header to proceed
        if i + HEADER_LEN > n:
            break

        # Look for sync
        if not (buf[i] == SYNC0 and buf[i+1] == SYNC1):
            i += 1
            continue

        # Check packet type
        if buf[i+2] != PKT_TYPE_DATA:
            # not the kind we want; skip this byte and continue searching
            i += 1
            continue

        did  = buf[i+3]
        size = buf[i+4] | (buf[i+5] << 8)   # payload size (little endian)

        # Full frame length = header + payload
        total = HEADER_LEN + size
        end   = i + total

        # If full frame not yet in buffer, stop and keep tail for next time
        if end > n:
            break

        # We have a full frame
        payload = bytes(buf[i + HEADER_LEN : end])

        if did == DID_PIMU and size == PIMU_SIZE:
            p = parse_pimu(payload)
            if p:
                print(
                    f"[PIMU decode] t={p['time']:.6f}s dt={p['dt']:.6f}s "
                    f"theta=[{p['theta'][0]:+.6f} {p['theta'][1]:+.6f} {p['theta'][2]:+.6f}] "
                    f"vel=[{p['vel'][0]:+.6f} {p['vel'][1]:+.6f} {p['vel'][2]:+.6f}] "
                    f"status=0x{p['status']:08X}"
                )
        # advance to the next frame candidate
        i = end

    # Save any unconsumed tail (partial header/frame) for next call
    _carry = buf[i:]


def drive_line_low_once(chip_name: str, line_offset: int, ms: int = 1):
    """Drive a GPIO line LOW briefly, then release. Supports gpiod v1 or v2."""
    try:
        import gpiod
        # v2 API?
        if hasattr(gpiod, "request_lines"):
            req = gpiod.request_lines(
                chip_name,
                consumer="imu-init-low",
                config={ line_offset: gpiod.LineSettings(
                    direction=gpiod.LineDirection.OUTPUT,
                    output_value=0
                )}
            )
            time.sleep(max(0, ms) / 1000.0)
            req.release()
        else:
            # v1 API
            chip = gpiod.Chip(chip_name)
            line = chip.get_line(line_offset)
            line.request(consumer="imu-init-low",
                         type=gpiod.LINE_REQ_DIR_OUT,
                         default_vals=[0])
            time.sleep(max(0, ms) / 1000.0)
            line.release()
            chip.close()
        print(f"[GPIO] Drove {chip_name} line {line_offset} LOW for {ms} ms.")
    except Exception as e:
        print(f"[GPIO] WARN: could not drive {chip_name}:{line_offset} LOW: {e}")

# ================= Main =================
def main():
    # Pull the chosen pin low briefly, then proceed
    drive_line_low_once(DRIVE_LOW_CHIP, DRIVE_LOW_LINE, DRIVE_LOW_MS)

    spi = spidev.SpiDev()
    spi.open(SPI_BUS, SPI_DEV)
    spi.mode = SPI_MODE
    spi.max_speed_hz = SPI_HZ
    spi.lsbfirst = False
    spi.bits_per_word = 8

    # Build bursts (bytes + bytes so types match)
    init_burst  = bytes(INIT_FRAME) + bytes(PAD_BYTES)
    query_burst = QUERY_FRAME       + bytes(PAD_BYTES)

    # Send init once
    rx_init = spi.xfer2(list(init_burst))
    scan_and_decode(rx_init)
    
    # Main loop
    try:
        while True:
            rx = spi.xfer2(list(query_burst))
            scan_and_decode(rx)
            time.sleep(0.1)
    except KeyboardInterrupt:
        pass
    finally:
        spi.close()
        print("Closed SPI device.")

if __name__ == "__main__":
    main()





