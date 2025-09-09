# #!/usr/bin/env python3
# import argparse, time, binascii, struct, serial

# # ---------- ISComm constants ----------
# SYNC1, SYNC2 = 0xEF, 0x49
# HEADER_LEN   = 7
# FOOTER_LEN   = 2
# PKT_TYPE_DATA = 0x04

# # Fletcher16 (c<<8)|a like the SDK
# def fletcher16(body: bytes) -> int:
#     a = 0; c = 0
#     for x in body:
#         a = (a + (x & 0xFF)) & 0xFF
#         c = (c + a) & 0xFF
#     return (c << 8) | a

# def hexstr(b: bytes) -> str:
#     return binascii.hexlify(b).decode()

# # ---------- Inner data header ----------
# # p_data_hdr_t { uint8_t id; uint16_t size; uint16_t offset; }
# DATA_HDR_FMT  = "<BHH"
# DATA_HDR_SIZE = struct.calcsize(DATA_HDR_FMT)

# # ---------- PIMU payload ----------
# DID_PIMU  = 3
# PIMU_FMT  = "<d f I 3f 3f"  # time, dt, status, theta[3], vel[3]
# PIMU_SIZE = struct.calcsize(PIMU_FMT)

# # A tiny DID name map for readability (add to taste)
# DID_NAMES = {
#     3:  "DID_PIMU",
#     4:  "DID_IMU",
#     12: "DID_INS_? (12)",   # placeholder; exact name depends on your SDK version
#     41: "DID_41 (?)",
#     # add more as you learn them
# }

# # ---------- Parser ----------
# def parse_one(buf: bytearray):
#     """Return (pkt_type, outer_did, payload, full) or None."""
#     i = 0
#     while True:
#         j = -1
#         for k in range(i, len(buf)-1):
#             if buf[k] == SYNC1 and buf[k+1] == SYNC2:
#                 j = k; break
#         if j < 0:
#             if i: del buf[:i]
#             return None
#         if len(buf) - j < HEADER_LEN:
#             if j: del buf[:j]
#             return None
#         # type|flags (LE), outer_did (LE), BUT payload length is BE (your probe)
#         try:
#             _, _, type_flags, outer_did, _plen_le = struct.unpack_from("<BBBH H", buf, j)
#         except struct.error:
#             if j: del buf[:j]
#             return None
#         plen = int.from_bytes(buf[j+5:j+7], "big")
#         total = HEADER_LEN + plen + FOOTER_LEN
#         if len(buf) - j < total:
#             if j: del buf[:j]
#             return None
#         body = bytes(buf[j : j + HEADER_LEN + plen])
#         rx_ck = int.from_bytes(buf[j + HEADER_LEN + plen : j + total], "little")
#         if rx_ck != fletcher16(body):
#             i = j + 1
#             continue
#         payload  = body[HEADER_LEN:]
#         pkt_type = type_flags & 0x0F
#         full     = body + buf[j + HEADER_LEN + plen : j + total]
#         del buf[: j + total]
#         return pkt_type, outer_did, payload, full

# # ---------- Build a proper "request data" packet for DID_PIMU ----------
# # This mirrors the SDK structure used by is_comm_get_data_to_buf:
# # Header:  [EF][49][type|flags][outer_did u16 LE][len u16 BE]
# # Payload: [did u8][size u16 LE][offset u16 LE][periodMultiple u16 LE]  (minimal GET_DATA)
# # Footer:  [Fletcher16 u16 LE]  over header+payload
# PKT_TYPE_GET_DATA = 0x03   # matches your second frame's TYPE nibble (0x03)

# def build_get_data(did: int, size: int, offset: int, period_ms: int) -> bytes:
#     # The SDK uses a "periodMultiple" (e.g., 50 ms). We’ll put period_ms as u16.
#     payload = struct.pack("<BHHH", did & 0xFF, size & 0xFFFF, offset & 0xFFFF, period_ms & 0xFFFF)
#     type_flags = PKT_TYPE_GET_DATA
#     outer_did  = 0  # typical for requests
#     # Header fields: SYNC1 SYNC2 TYPE outer_did(le) payload_len(be)
#     header = struct.pack("<BBBH", SYNC1, SYNC2, type_flags, outer_did) + len(payload).to_bytes(2, "big")
#     ck = fletcher16(header + payload)
#     return header + payload + struct.pack("<H", ck)

# def print_pimu(body: bytes):
#     if len(body) < PIMU_SIZE:
#         print(f"  PIMU: (body too short: {len(body)} bytes; need {PIMU_SIZE})")
#         return
#     t, dt, status, thx, thy, thz, vx, vy, vz = struct.unpack_from(PIMU_FMT, body, 0)
#     print(f"time: {t:.3f} s\tdt: {dt:.6f} s\t"
#           f"theta [rad]: {thx:.6f}, {thy:.6f}, {thz:.6f}\t"
#           f"vel [m/s]: {vx:.6f}, {vy:.6f}, {vz:.6f}")

# def main():
#     ap = argparse.ArgumentParser()
#     ap.add_argument("--port", default="/dev/ttyS5")
#     ap.add_argument("--baud", type=int, default=115200)
#     ap.add_argument("--timeout", type=float, default=0.2)
#     ap.add_argument("--rx-chunk", type=int, default=1024)
#     ap.add_argument("--no-tx", action="store_true", help="Skip any requests; just listen")
#     ap.add_argument("--request-pimu", action="store_true", help="Send a proper GET_DATA for PIMU (size=40, period=50ms)")
#     ap.add_argument("--rawtap", action="store_true")
#     args = ap.parse_args()

#     ser = serial.Serial(args.port, args.baud, timeout=args.timeout,
#                         bytesize=serial.EIGHTBITS, parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE,
#                         xonxoff=False, rtscts=False, dsrdtr=False)
#     try:
#         ser.dtr = False; ser.rts = False
#     except Exception:
#         pass

#     print(f"Opened {ser.port} @ {args.baud} 8N1")

#     if not args.no_tx:
#         if args.request_pimu:
#             pkt = build_get_data(DID_PIMU, PIMU_SIZE, 0, 50)  # 20 Hz like Arduino example
#             print(f"TX GET PIMU: {hexstr(pkt)}")
#             ser.write(pkt); ser.flush()
#             time.sleep(0.05)
#         else:
#             # Keep this path if you still want to try your old frame
#             FRAME1 = bytes.fromhex("ef4906000000003e1fef49030008000300280000003200a0a7")
#             print(f"TX (FRAME1): {hexstr(FRAME1)}")
#             ser.write(FRAME1); ser.flush()
#             time.sleep(0.05)

#     rxbuf = bytearray()
#     last = time.time()

#     try:
#         while True:
#             chunk = ser.read(args.rx_chunk)
#             if chunk:
#                 if args.rawtap:
#                     print(f"RAW +{len(chunk)}: {hexstr(chunk)}")
#                 rxbuf.extend(chunk)
#                 while True:
#                     pkt = parse_one(rxbuf)
#                     if not pkt: break
#                     pkt_type, outer_did, payload, _ = pkt
#                     if pkt_type != PKT_TYPE_DATA or len(payload) < DATA_HDR_SIZE:
#                         print(f"Packet: type=0x{pkt_type:02x}, outer_did={outer_did}, payload_len={len(payload)}")
#                         continue
#                     did, size, offset = struct.unpack_from(DATA_HDR_FMT, payload, 0)
#                     body = payload[DATA_HDR_SIZE:]
#                     name = DID_NAMES.get(did, f"DID_{did}")
#                     print(f"DATA: did={did} ({name}) size={size} offset={offset} body_len={len(body)}")
#                     if did == DID_PIMU and len(body) >= PIMU_SIZE:
#                         print_pimu(body)
#             else:
#                 if time.time() - last > 5:
#                     print(".", end="", flush=True)
#                     last = time.time()
#     except KeyboardInterrupt:
#         pass
#     finally:
#         ser.close()

# if __name__ == "__main__":
#     main()


# #!/usr/bin/env python3
# import argparse, time, binascii, struct, serial

# # ---------- ISComm constants ----------
# SYNC1, SYNC2 = 0xEF, 0x49
# HEADER_LEN   = 7
# FOOTER_LEN   = 2

# # Fletcher16 (c<<8)|a like the SDK
# def fletcher16(body: bytes) -> int:
#     a = 0; c = 0
#     for x in body:
#         a = (a + (x & 0xFF)) & 0xFF
#         c = (c + a) & 0xFF
#     return (c << 8) | a

# def hexstr(b: bytes) -> str:
#     return binascii.hexlify(b).decode()

# # ---------- Build a "request data" packet (optional) ----------
# PKT_TYPE_GET_DATA = 0x03   # GET
# DID_PIMU  = 3
# PIMU_FMT_SIZE = 40  # time(double) + dt(float) + status(u32) + 3f + 3f

# def build_get_data(did: int, size: int, offset: int, period_ms: int) -> bytes:
#     # Payload: [did u8][size u16 LE][offset u16 LE][periodMultiple u16 LE]
#     payload = struct.pack("<BHHH", did & 0xFF, size & 0xFFFF, offset & 0xFFFF, period_ms & 0xFFFF)
#     type_flags = PKT_TYPE_GET_DATA
#     outer_did  = 0  # typical for requests
#     # Header: [EF][49][type|flags][outer_did u16 LE][len u16 BE]
#     header = struct.pack("<BBBH", SYNC1, SYNC2, type_flags, outer_did) + len(payload).to_bytes(2, "big")
#     ck = fletcher16(header + payload)
#     return header + payload + struct.pack("<H", ck)

# # ---------- Frame grabber ----------
# def grab_one_frame(buf: bytearray):
#     """
#     Find next EF49 frame. Returns (frame_bytes) or None if more data needed.
#     Uses BE payload length and Fletcher16 (c<<8)|a verification.
#     """
#     i = 0
#     while True:
#         # find sync
#         j = -1
#         for k in range(i, len(buf) - 1):
#             if buf[k] == SYNC1 and buf[k+1] == SYNC2:
#                 j = k
#                 break
#         if j < 0:
#             if i:
#                 del buf[:i]
#             return None  # need more data

#         # need full header?
#         if len(buf) - j < HEADER_LEN:
#             if j:
#                 del buf[:j]
#             return None

#         # read header fields (type|flags, outer_did LE, length BE)
#         try:
#             # we don't actually need type/outer_did; read anyway to keep consistent
#             _, _, _type_flags, _outer_did, _plen_le = struct.unpack_from("<BBBH H", buf, j)
#         except struct.error:
#             # corrupt near here; skip this sync
#             i = j + 1
#             continue

#         plen = int.from_bytes(buf[j+5:j+7], "big")  # payload length is BE
#         total = HEADER_LEN + plen + FOOTER_LEN
#         if len(buf) - j < total:
#             if j:
#                 del buf[:j]
#             return None  # incomplete, wait for more

#         # verify checksum
#         body = bytes(buf[j : j + HEADER_LEN + plen])  # header+payload
#         rx_ck = int.from_bytes(buf[j + HEADER_LEN + plen : j + total], "little")
#         if rx_ck != fletcher16(body):
#             # bad checksum; skip this sync and keep scanning
#             i = j + 1
#             continue

#         # success: return full frame
#         frame = bytes(buf[j : j + total])
#         del buf[: j + total]
#         return frame

# def main():
#     ap = argparse.ArgumentParser(description="Print verified EF49 frames as hex")
#     ap.add_argument("--port", default="/dev/ttyS5")
#     ap.add_argument("--baud", type=int, default=115200)
#     ap.add_argument("--timeout", type=float, default=0.2)
#     ap.add_argument("--rx-chunk", type=int, default=1024)
#     ap.add_argument("--no-tx", action="store_true", help="Don't transmit anything; just listen")
#     ap.add_argument("--request-pimu", action="store_true", help="Send GET_DATA for DID_PIMU (size=40, period=50ms) once")
#     ap.add_argument("--kick-frame1", action="store_true", help="Send your original FRAME1 once")
#     ap.add_argument("--prefix", action="store_true", help="Prefix each line with len and timestamp")
#     args = ap.parse_args()

#     ser = serial.Serial(
#         args.port, args.baud, timeout=args.timeout,
#         bytesize=serial.EIGHTBITS, parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE,
#         xonxoff=False, rtscts=False, dsrdtr=False
#     )
#     try:
#         ser.dtr = False
#         ser.rts = False
#     except Exception:
#         pass

#     print(f"Opened {ser.port} @ {args.baud} 8N1")

#     if not args.no_tx:
#         if args.request_pimu:
#             pkt = build_get_data(DID_PIMU, PIMU_FMT_SIZE, 0, 50)  # ~20 Hz
#             print(f"TX: {hexstr(pkt)}")
#             ser.write(pkt)
#             ser.flush()
#             time.sleep(0.05)
#         elif args.kick_frame1:
#             FRAME1 = bytes.fromhex("ef4906000000003e1fef49030008000300280000003200a0a7")
#             print(f"TX: {hexstr(FRAME1)}")
#             ser.write(FRAME1)
#             ser.flush()
#             time.sleep(0.05)

#     rxbuf = bytearray()
#     heartbeat_ts = time.time()

#     try:
#         while True:
#             chunk = ser.read(args.rx_chunk)
#             if chunk:
#                 rxbuf.extend(chunk)
#                 while True:
#                     frame = grab_one_frame(rxbuf)
#                     if frame is None:
#                         break
#                     if args.prefix:
#                         ts = time.time()
#                         print(f"[{ts:.3f}] len={len(frame)} {hexstr(frame)}")
#                     else:
#                         print(hexstr(frame))
#             else:
#                 # heartbeat so you know it's alive
#                 if time.time() - heartbeat_ts > 5:
#                     print(".", end="", flush=True)
#                     heartbeat_ts = time.time()
#     except KeyboardInterrupt:
#         pass
#     finally:
#         ser.close()

# if __name__ == "__main__":
#     main()

#!/usr/bin/env python3
# import argparse, time, binascii, struct, serial

# SYNC1, SYNC2 = 0xEF, 0x49
# HEADER_LEN   = 7
# FOOTER_LEN   = 2

# def fletcher16(body: bytes) -> int:
#     a = c = 0
#     for x in body:
#         a = (a + x) & 0xFF
#         c = (c + a) & 0xFF
#     return (c << 8) | a

# def hexstr(b: bytes, spaced=True) -> str:
#     if spaced:
#         return " ".join(f"{x:02x}" for x in b)
#     else:
#         return binascii.hexlify(b).decode()

# def grab_one_frame(buf: bytearray):
#     """Return (frame_bytes, ok_crc) or None if incomplete."""
#     i = 0
#     while True:
#         j = -1
#         for k in range(i, len(buf)-1):
#             if buf[k] == SYNC1 and buf[k+1] == SYNC2:
#                 j = k
#                 break
#         if j < 0:
#             if i:
#                 del buf[:i]
#             return None

#         if len(buf) - j < HEADER_LEN:
#             if j:
#                 del buf[:j]
#             return None

#         try:
#             _, _, _type_flags, _outer_did, _plen_le = struct.unpack_from("<BBBH H", buf, j)
#         except struct.error:
#             i = j + 1
#             continue

#         plen = int.from_bytes(buf[j+5:j+7], "big")
#         total = HEADER_LEN + plen + FOOTER_LEN
#         if len(buf) - j < total:
#             if j:
#                 del buf[:j]
#             return None

#         body = bytes(buf[j : j + HEADER_LEN + plen])
#         rx_ck = int.from_bytes(buf[j + HEADER_LEN + plen : j + total], "little")
#         ok = (rx_ck == fletcher16(body))
#         frame = bytes(buf[j : j + total])
#         del buf[: j + total]
#         return frame, ok

# def main():
#     ap = argparse.ArgumentParser()
#     ap.add_argument("--port", default="/dev/ttyS5")
#     ap.add_argument("--baud", type=int, default=115200)
#     ap.add_argument("--timeout", type=float, default=0.2)
#     ap.add_argument("--rx-chunk", type=int, default=1024)
#     ap.add_argument("--compact", action="store_true", help="Print compact hex (no spaces)")
#     args = ap.parse_args()

#     ser = serial.Serial(args.port, args.baud, timeout=args.timeout)
#     print(f"Opened {ser.port} @ {args.baud} 8N1")

#     rxbuf = bytearray()
#     try:
#         while True:
#             chunk = ser.read(args.rx_chunk)
#             if chunk:
#                 rxbuf.extend(chunk)
#                 while True:
#                     out = grab_one_frame(rxbuf)
#                     if out is None:
#                         break
#                     frame, ok = out
#                     prefix = "OK " if ok else "BADCRC "
#                     print(prefix + hexstr(frame, spaced=not args.compact))
#     except KeyboardInterrupt:
#         pass
#     finally:
#         ser.close()

# if __name__ == "__main__":
#     main()


#!/usr/bin/env python3
# import argparse, time, binascii, struct, serial

# # ---------- ISComm constants ----------
# SYNC1, SYNC2 = 0xEF, 0x49
# HEADER_LEN   = 7
# FOOTER_LEN   = 2
# PKT_TYPE_DATA = 0x04

# # Fletcher16 (c<<8)|a like the SDK
# def fletcher16(body: bytes) -> int:
#     a = 0; c = 0
#     for x in body:
#         a = (a + (x & 0xFF)) & 0xFF
#         c = (c + a) & 0xFF
#     return (c << 8) | a

# def hexstr(b: bytes) -> str:
#     return binascii.hexlify(b).decode()

# # ---------- Inner data header ----------
# # p_data_hdr_t { uint8_t id; uint16_t size; uint16_t offset; }
# DATA_HDR_FMT  = "<BHH"
# DATA_HDR_SIZE = struct.calcsize(DATA_HDR_FMT)

# # ---------- PIMU payload ----------
# DID_PIMU  = 3
# PIMU_FMT  = "<d f I 3f 3f"  # time, dt, status, theta[3], vel[3]
# PIMU_SIZE = struct.calcsize(PIMU_FMT)

# # A tiny DID name map for readability (add to taste)
# DID_NAMES = {
#     3:  "DID_PIMU",
#     4:  "DID_IMU",
#     12: "DID_FLASH_CONFIG",
#     41: "DID_41 (?)",
# }

# # ---------- Parser ----------
# def parse_one(buf: bytearray):
#     """Return (pkt_type, outer_did, payload, full) or None."""
#     i = 0
#     while True:
#         j = -1
#         for k in range(i, len(buf)-1):
#             if buf[k] == SYNC1 and buf[k+1] == SYNC2:
#                 j = k; break
#         if j < 0:
#             if i: del buf[:i]
#             return None
#         if len(buf) - j < HEADER_LEN:
#             if j: del buf[:j]
#             return None
#         # type|flags (LE), outer_did (LE), BUT payload length is BE
#         try:
#             _, _, type_flags, outer_did, _plen_le = struct.unpack_from("<BBBH H", buf, j)
#         except struct.error:
#             if j: del buf[:j]
#             return None
#         plen = int.from_bytes(buf[j+5:j+7], "big")
#         total = HEADER_LEN + plen + FOOTER_LEN
#         if len(buf) - j < total:
#             if j: del buf[:j]
#             return None
#         body = bytes(buf[j : j + HEADER_LEN + plen])
#         rx_ck = int.from_bytes(buf[j + HEADER_LEN + plen : j + total], "little")
#         if rx_ck != fletcher16(body):
#             i = j + 1
#             continue
#         payload  = body[HEADER_LEN:]
#         pkt_type = type_flags & 0x0F
#         full     = body + buf[j + HEADER_LEN + plen : j + total]
#         del buf[: j + total]
#         return pkt_type, outer_did, payload, full

# def print_pimu(body: bytes):
#     if len(body) < PIMU_SIZE:
#         print(f"  PIMU: (body too short: {len(body)} bytes; need {PIMU_SIZE})")
#         return
#     t, dt, status, thx, thy, thz, vx, vy, vz = struct.unpack_from(PIMU_FMT, body, 0)
#     print(f"time: {t:.3f} s\tdt: {dt:.6f} s\t"
#           f"theta [rad]: {thx:.6f}, {thy:.6f}, {thz:.6f}\t"
#           f"vel [m/s]: {vx:.6f}, {vy:.6f}, {vz:.6f}")

# # ---------- EXACT HEX FRAME TO REQUEST PIMU @ 20 Hz ----------
# # Header: EF 49 | 03 | 00 00 | 00 07
# # Payload: 03 | 28 00 | 00 00 | 32 00
# # CRC: 25 5e (LE)
# GET_PIMU_FRAME = bytes.fromhex(
#     "ef49030008000300280000003200a0a7"
# )

# # FRAME1 = bytes.fromhex("ef4906000000003e1fef49030008000300280000003200a0a7")



# def main():
#     ap = argparse.ArgumentParser()
#     ap.add_argument("--port", default="/dev/ttyS5")
#     ap.add_argument("--baud", type=int, default=115200)
#     ap.add_argument("--timeout", type=float, default=0.2)
#     ap.add_argument("--rx-chunk", type=int, default=1024)
#     ap.add_argument("--no-tx", action="store_true", help="Skip request; just listen")
#     ap.add_argument("--rawtap", action="store_true")
#     args = ap.parse_args()

#     ser = serial.Serial(args.port, args.baud, timeout=args.timeout,
#                         bytesize=serial.EIGHTBITS, parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE,
#                         xonxoff=False, rtscts=False, dsrdtr=False)
#     try:
#         ser.dtr = False; ser.rts = False
#     except Exception:
#         pass

#     print(f"Opened {ser.port} @ {args.baud} 8N1")

#     # —— Send the PIMU request frame exactly once (unless --no-tx) ——
#     if not args.no_tx:
#         print(f"TX GET PIMU: {hexstr(GET_PIMU_FRAME)}")
#         ser.write(GET_PIMU_FRAME)
#         ser.flush()
#         time.sleep(0.05)

#     rxbuf = bytearray()
#     last = time.time()

#     try:
#         while True:
#             chunk = ser.read(args.rx_chunk)
#             if chunk:
#                 if args.rawtap:
#                     print(f"RAW +{len(chunk)}: {hexstr(chunk)}")
#                 rxbuf.extend(chunk)
#                 while True:
#                     pkt = parse_one(rxbuf)
#                     if not pkt: break
#                     pkt_type, outer_did, payload, _ = pkt
#                     if pkt_type != PKT_TYPE_DATA or len(payload) < DATA_HDR_SIZE:
#                         print(f"Packet: type=0x{pkt_type:02x}, outer_did={outer_did}, payload_len={len(payload)}")
#                         continue
#                     did, size, offset = struct.unpack_from(DATA_HDR_FMT, payload, 0)
#                     body = payload[DATA_HDR_SIZE:]
#                     name = DID_NAMES.get(did, f"DID_{did}")
#                     print(f"DATA: did={did} ({name}) size={size} offset={offset} body_len={len(body)}")
#                     if did == DID_PIMU and len(body) >= PIMU_SIZE:
#                         print_pimu(body)
#             else:
#                 if time.time() - last > 5:
#                     print(".", end="", flush=True)
#                     last = time.time()
#     except KeyboardInterrupt:
#         pass
#     finally:
#         ser.close()

# if __name__ == "__main__":
#     main()




#!/usr/bin/env python3
# import argparse, time, binascii, struct, serial

# # ---------- ISComm constants ----------
# SYNC1, SYNC2 = 0xEF, 0x49
# HEADER_LEN   = 7            # 2 (preamble) + 1 (flags) + 2 (id u16 LE) + 2 (payloadLen BE)
# FOOTER_LEN   = 2
# PKT_TYPE_DATA = 0x04
# PKT_TYPE_GET  = 0x03

# # Fletcher16 (c<<8)|a like the SDK
# def fletcher16(body: bytes) -> int:
#     a = 0; c = 0
#     for x in body:
#         a = (a + (x & 0xFF)) & 0xFF
#         c = (c + a) & 0xFF
#     return (c << 8) | a

# def hexstr(b: bytes, spaced=False) -> str:
#     if spaced:
#         return " ".join(f"{x:02x}" for x in b)
#     return binascii.hexlify(b).decode()

# # ---------- PIMU payload ----------
# DID_PIMU  = 3
# PIMU_FMT  = "<d f I 3f 3f"  # time, dt, status, theta[3], vel[3]
# PIMU_SIZE = struct.calcsize(PIMU_FMT) - 1

# # ---------- EXACT HEX FRAME TO REQUEST PIMU @ 20 Hz ----------
# # Header: EF 49 | 03 | 00 00 | 00 07
# # Payload: 03 | 28 00 | 00 00 | 32 00
# # CRC: 25 5e (LE)
# GET_PIMU_FRAME = bytes.fromhex(
#     "ef49030008000300280000003200a0a7"  # preamble + type + id(0x0000 LE) + payloadLen(0x0007 BE)
# )

# #ef49030000000703280000003200255e
# # ef49030008000300280000003200a0a7
# # ef49030007000300280000003200255e
# # ---------- Parser ----------
# def parse_one(buf: bytearray):
#     """
#     Find next EF49 frame with checksum OK.
#     Return (flags, did_le, did_be, payload_bytes, full_frame_bytes) or None.
#     """
#     i = 0
#     while True:
#         # locate sync
#         j = -1
#         for k in range(i, len(buf)-1):
#             if buf[k] == SYNC1 and buf[k+1] == SYNC2:
#                 j = k
#                 break
#         if j < 0:
#             if i:
#                 del buf[:i]
#             return None

#         # need full header?
#         if len(buf) - j < HEADER_LEN:
#             if j:
#                 del buf[:j]
#             return None

#         # header fields
#         try:
#             # <BBBH reads: SYNC1, SYNC2, flags, id (u16 LE)
#             _s1, _s2, flags, did_le = struct.unpack_from("<BBBH", buf, j)
#         except struct.error:
#             i = j + 1
#             continue

#         # payload len is BIG-ENDIAN at bytes 5..6
#         plen = int.from_bytes(buf[j+5:j+7], "big")
#         total = HEADER_LEN + plen + FOOTER_LEN
#         if len(buf) - j < total:
#             if j:
#                 del buf[:j]
#             return None

#         # verify checksum
#         body  = bytes(buf[j : j + HEADER_LEN + plen])           # header+payload
#         rx_ck = int.from_bytes(buf[j + HEADER_LEN + plen : j + total], "little")
#         if rx_ck != fletcher16(body):
#             # bad CRC; skip this sync
#             i = j + 1
#             continue

#         frame   = bytes(buf[j : j + total])
#         payload = body[HEADER_LEN:]

#         # also compute BE view of DID (sometimes useful for sanity)
#         did_be = int.from_bytes(buf[j+3:j+5], "big")

#         del buf[: j + total]
#         return flags, did_le, did_be, payload, frame

# def print_pimu(payload: bytes):
#     if len(payload) < PIMU_SIZE:
#         print(f"PIMU (payload too short: {len(payload)} bytes; need {PIMU_SIZE})")
#         return
#     t, dt, status, thx, thy, thz, vx, vy, vz = struct.unpack_from(PIMU_FMT, payload, 0)
#     print(
#         f"t={t:.3f}s  dt={dt:.6f}s  "
#         f"dtheta(rad)=({thx:.6f}, {thy:.6f}, {thz:.6f})  "
#         f"dV(m/s)=({vx:.6f}, {vy:.6f}, {vz:.6f})  status=0x{status:08x}"
#     )

# def main():
#     ap = argparse.ArgumentParser()
#     ap.add_argument("--port", default="/dev/ttyS5")
#     ap.add_argument("--baud", type=int, default=115200)
#     ap.add_argument("--timeout", type=float, default=0.2)
#     ap.add_argument("--rx-chunk", type=int, default=1024)
#     ap.add_argument("--no-tx", action="store_true", help="Skip request; just listen")
#     ap.add_argument("--rawtap", action="store_true", help="Print raw bytes received")
#     ap.add_argument("--frames", action="store_true", help="Print full frame hex on receive")
#     args = ap.parse_args()

#     ser = serial.Serial(
#         args.port, args.baud, timeout=args.timeout,
#         bytesize=serial.EIGHTBITS, parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE,
#         xonxoff=False, rtscts=False, dsrdtr=False
#     )
#     try:
#         ser.dtr = False
#         ser.rts = False
#     except Exception:
#         pass

#     print(f"Opened {ser.port} @ {args.baud} 8N1")

#     # — Send the PIMU request once —
#     if not args.no_tx:
#         print(f"TX GET PIMU: {hexstr(GET_PIMU_FRAME)}")
#         ser.write(GET_PIMU_FRAME)
#         ser.flush()
#         time.sleep(0.05)

#     rxbuf = bytearray()
#     last  = time.time()

#     try:
#         while True:
#             chunk = ser.read(args.rx_chunk)
#             if chunk:
#                 if args.rawtap:
#                     print(f"RAW +{len(chunk)}: {hexstr(chunk)}")
#                 rxbuf.extend(chunk)

#                 while True:
#                     parsed = parse_one(rxbuf)
#                     if not parsed:
#                         break

#                     flags, did_le, did_be, payload, frame = parsed
#                     pkt_type = flags & 0x0F

#                     if args.frames:
#                         print(f"RX frame ({len(frame)}B): {hexstr(frame)}")

#                     # Accept DID from LE; if it's bizarre but BE says 3, treat as PIMU
#                     did = did_le
#                     if did != DID_PIMU and (did & 0x00FF) == DID_PIMU:
#                         # low byte looks like PIMU (e.g., did_le=0x2803); prefer low byte
#                         did = DID_PIMU
#                     if did != DID_PIMU and did_be == DID_PIMU:
#                         did = DID_PIMU

#                     if pkt_type == PKT_TYPE_DATA and did == DID_PIMU:
#                         if len(payload) == PIMU_SIZE:
#                             print_pimu(payload)
#                         else:
#                             print(f"PIMU but size={len(payload)} (expected 40) — cannot decode")
#                     else:
#                         # You can print other DIDs here if helpful:
#                         # print(f"DATA DID={did_le} (BE view={did_be}) size={len(payload)}")
#                         pass

#             else:
#                 if time.time() - last > 5:
#                     print(".", end="", flush=True)
#                     last = time.time()
#     except KeyboardInterrupt:
#         pass
#     finally:
#         ser.close()

# if __name__ == "__main__":
#     main()



#!/usr/bin/env python3
import argparse, time, binascii, struct, serial

# ---------- ISComm constants ----------
SYNC1, SYNC2 = 0xEF, 0x49
HEADER_LEN   = 7            # 2 (preamble) + 1 (flags) + 2 (id u16 LE) + 2 (payloadLen BE)
FOOTER_LEN   = 2
PKT_TYPE_DATA = 0x04
PKT_TYPE_GET  = 0x03

# Fletcher16 (c<<8)|a like the SDK
def fletcher16(body: bytes) -> int:
    a = 0; c = 0
    for x in body:
        a = (a + (x & 0xFF)) & 0xFF
        c = (c + a) & 0xFF
    return (c << 8) | a

def hexstr(b: bytes, spaced=False) -> str:
    if spaced:
        return " ".join(f"{x:02x}" for x in b)
    return binascii.hexlify(b).decode()

# ---------- PIMU payload ----------
DID_PIMU  = 3
PIMU_FMT  = "<d f I 3f 3f"        # time, dt, status, theta[3], vel[3]
PIMU_SIZE = struct.calcsize(PIMU_FMT)  # 40 bytes

# ---------- EXACT HEX FRAME TO REQUEST PIMU @ 20 Hz ----------
GET_PIMU_FRAME = bytes.fromhex(
    "ef49030008000300280000003200a0a7"
)

# ---------- Parser ----------
def parse_one(buf: bytearray):
    """
    Find next EF49 frame with checksum OK.
    Return (flags, did_le, did_be, payload_bytes, full_frame_bytes) or None.
    """
    i = 0
    while True:
        # locate sync
        j = -1
        for k in range(i, len(buf)-1):
            if buf[k] == SYNC1 and buf[k+1] == SYNC2:
                j = k
                break
        if j < 0:
            if i:
                del buf[:i]
            return None

        # need full header?
        if len(buf) - j < HEADER_LEN:
            if j:
                del buf[:j]
            return None

        # header fields
        try:
            _s1, _s2, flags, did_le = struct.unpack_from("<BBBH", buf, j)  # id (u16 LE)
        except struct.error:
            i = j + 1
            continue

        # payload len is BIG-ENDIAN at bytes 5..6 (your current assumption)
        plen = int.from_bytes(buf[j+5:j+7], "big")
        total = HEADER_LEN + plen + FOOTER_LEN
        if len(buf) - j < total:
            if j:
                del buf[:j]
            return None

        # verify checksum
        body  = bytes(buf[j : j + HEADER_LEN + plen])           # header+payload
        rx_ck = int.from_bytes(buf[j + HEADER_LEN + plen : j + total], "little")
        if rx_ck != fletcher16(body):
            # bad CRC; skip this sync
            i = j + 1
            continue

        frame   = bytes(buf[j : j + total])
        payload = body[HEADER_LEN:]

        # also compute BE view of DID (sometimes useful for sanity)
        did_be = int.from_bytes(buf[j+3:j+5], "big")

        del buf[: j + total]
        return flags, did_le, did_be, payload, frame

def print_pimu(payload: bytes):
    # --- NEW: if 39 bytes, pad a leading 0x00 before unpacking ---
    orig_len = len(payload)
    if orig_len == PIMU_SIZE - 1:          # 39
        payload = b"\x00" + payload
    if len(payload) < PIMU_SIZE:
        print(f"PIMU (payload too short: {orig_len} bytes; need 40)")
        return

    t, dt, status, thx, thy, thz, vx, vy, vz = struct.unpack_from(PIMU_FMT, payload, 0)
    note = " (padded)" if orig_len == PIMU_SIZE - 1 else ""
    print(
        f"t={t:.3f}s  dt={dt:.6f}s  "
        f"dtheta(rad)=({thx:.6f}, {thy:.6f}, {thz:.6f})  "
        f"dV(m/s)=({vx:.6f}, {vy:.6f}, {vz:.6f})  status=0x{status:08x}{note}"
    )

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", default="/dev/ttyS5")
    ap.add_argument("--baud", type=int, default=57600)
    ap.add_argument("--timeout", type=float, default=0.2)
    ap.add_argument("--rx-chunk", type=int, default=1024)
    ap.add_argument("--no-tx", action="store_true", help="Skip request; just listen")
    ap.add_argument("--rawtap", action="store_true", help="Print raw bytes received")
    ap.add_argument("--frames", action="store_true", help="Print full frame hex on receive")
    args = ap.parse_args()

    ser = serial.Serial(
        args.port, args.baud, timeout=args.timeout,
        bytesize=serial.EIGHTBITS, parity=serial.PARITY_NONE, stopbits=serial.STOPBITS_ONE,
        xonxoff=False, rtscts=False, dsrdtr=False
    )
    try:
        ser.dtr = False
        ser.rts = False
    except Exception:
        pass

    print(f"Opened {ser.port} @ {args.baud} 8N1")

    # — Send the PIMU request once —
    if not args.no_tx:
        print(f"TX GET PIMU: {hexstr(GET_PIMU_FRAME)}")
        ser.write(GET_PIMU_FRAME)
        ser.flush()
        time.sleep(0.05)

    rxbuf = bytearray()
    last  = time.time()

    try:
        while True:
            chunk = ser.read(args.rx_chunk)
            if chunk:
                if args.rawtap:
                    print(f"RAW +{len(chunk)}: {hexstr(chunk)}")
                rxbuf.extend(chunk)

                while True:
                    parsed = parse_one(rxbuf)
                    if not parsed:
                        break

                    flags, did_le, did_be, payload, frame = parsed
                    pkt_type = flags & 0x0F

                    if args.frames:
                        print(f"RX frame ({len(frame)}B): {hexstr(frame)}")

                    # Treat DID as PIMU if low byte is 3 (some builds send 0x2803 etc.)
                    did = did_le
                    if did != DID_PIMU and (did & 0x00FF) == DID_PIMU:
                        did = DID_PIMU
                    if did != DID_PIMU and did_be == DID_PIMU:
                        did = DID_PIMU

                    if pkt_type == PKT_TYPE_DATA and did == DID_PIMU:
                        # Accept 39 (pad) or 40 bytes for PIMU
                        if len(payload) in (PIMU_SIZE, PIMU_SIZE - 1):
                            print_pimu(payload)
                        else:
                            print(f"PIMU but size={len(payload)} (expected 40 or 39-to-pad) — cannot decode")
                    else:
                        pass

            else:
                if time.time() - last > 5:
                    print(".", end="", flush=True)
                    last = time.time()
    except KeyboardInterrupt:
        pass
    finally:
        ser.close()

if __name__ == "__main__":
    main()