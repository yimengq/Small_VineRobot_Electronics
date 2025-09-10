#!/usr/bin/env python3
import time, struct
import spidev

# ================= Config =================
SPI_BUS, SPI_DEV = 3, 0
SPI_MODE = 3
SPI_HZ   = 1_000_000
PAD_BYTES = 256

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
    t, = struct.unpack_from("<d", payload, 0)
    dt, = struct.unpack_from("<f", payload, 8)
    status, = struct.unpack_from("<I", payload, 12)
    th0, th1, th2 = struct.unpack_from("<3f", payload, 16)
    v0,  v1,  v2  = struct.unpack_from("<3f", payload, 28)
    return {"time": t, "dt": dt, "status": status, "theta": (th0, th1, th2), "vel": (v0, v1, v2)}

def scan_and_decode(rx_bytes: bytes):
    i, n = 0, len(rx_bytes)
    while i + 5 <= n:
        if rx_bytes[i] != SYNC0 or rx_bytes[i+1] != SYNC1:
            i += 1; continue
        if rx_bytes[i+2] != PKT_TYPE_DATA:
            i += 1; continue
        did   = rx_bytes[i+3]
        size  = rx_bytes[i+4] | (rx_bytes[i+5] << 8)
        start = i + 6
        end   = start + size
        if end > n: break
        payload = rx_bytes[start:end]
        if did == DID_PIMU and size == PIMU_SIZE:
            p = parse_pimu(payload)
            if p:
                print(
                    f"[PIMU decode] t={p['time']:.6f}s dt={p['dt']:.6f}s "
                    f"theta=[{p['theta'][0]:+.6f} {p['theta'][1]:+.6f} {p['theta'][2]:+.6f}] "
                    f"vel=[{p['vel'][0]:+.6f} {p['vel'][1]:+.6f} {p['vel'][2]:+.6f}] "
                    f"status=0x{p['status']:08X}"
                )
        i = end

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
