# iscomm_py.py
import struct
from dataclasses import dataclass

SYNC1 = 0xEF
SYNC2 = 0x49
HEADER_LEN = 7
FOOTER_LEN = 2

PTYPE_INERTIAL_SENSE_DATA = 0x04

# NEW (matches p_data_hdr_t)
DATA_HDR_FMT  = "<BHH"       # id:u8, size:u16, offset:u16  (little-endian)
DATA_HDR_SIZE = struct.calcsize(DATA_HDR_FMT)  # = 5

def fletcher16(data: bytes) -> int:
    # Variant: (c<<8)|a
    a = 0; c = 0
    for x in data:
        a = (a + (x & 0xFF)) & 0xFF
        c = (c + a) & 0xFF
    return (c << 8) | a

@dataclass
class RxDataHdr:
    id: int
    size: int
    offset: int

@dataclass
class RxPacket:
    type_flags: int
    outer_did: int
    payload: bytes
    dataHdr: RxDataHdr | None
    data_ptr: memoryview

class ISCommParser:
    def __init__(self):
        self.buf = bytearray()

    def push(self, b: bytes):
        self.buf.extend(b)
        out = []
        while True:
            pkt = self._parse_one()
            if not pkt:
                break
            out.append(pkt)
        return out

    def _parse_one(self):
        buf = self.buf
        i = 0
        while True:
            j = -1
            for k in range(i, len(buf)-1):
                if buf[k] == SYNC1 and buf[k+1] == SYNC2:
                    j = k; break
            if j < 0:
                if i: del buf[:i]
                return None
            if len(buf) - j < HEADER_LEN:
                if j: del buf[:j]
                return None
            try:
                _, _, type_flags, outer_did, _plen_le = struct.unpack_from("<BBBH H", buf, j)
            except struct.error:
                if j: del buf[:j]
                return None
            plen = int.from_bytes(buf[j+5:j+7], "big")  # big-endian length!
            total = HEADER_LEN + plen + FOOTER_LEN
            if len(buf) - j < total:
                if j: del buf[:j]
                return None
            body = bytes(buf[j:j+HEADER_LEN+plen])
            rx_ck = int.from_bytes(buf[j+HEADER_LEN+plen:j+total], "little")
            if rx_ck != fletcher16(body):
                i = j + 1
                continue
            payload = body[HEADER_LEN:]
            pkt_type = type_flags & 0x0F
            dataHdr = None
            data_ptr = memoryview(payload)
            if pkt_type == PTYPE_INERTIAL_SENSE_DATA and len(payload) >= DATA_HDR_SIZE:
                did, size, offset = struct.unpack_from(DATA_HDR_FMT, payload, 0)
                dataHdr = RxDataHdr(did, size, offset)
                data_ptr = memoryview(payload[DATA_HDR_SIZE:])
            del buf[: j + total]
            return RxPacket(type_flags, outer_did, payload, dataHdr, data_ptr)