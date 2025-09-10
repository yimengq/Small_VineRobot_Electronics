import gpiod, time
CHIP="/dev/gpiochip2"; LINE=6  # change LINE to a truly "unused" line you picked
chip=gpiod.Chip(CHIP)
line=chip.get_line(LINE)
line.request(consumer="gpiod_test", type=gpiod.LINE_REQ_DIR_IN)
for i in range(10):
    _ = line.get_value()
    time.sleep(0.2)
line.release(); chip.close()
print("OK")


python3 - <<'PY'
import gpiod, time
chip=gpiod.Chip("/dev/gpiochip2")  # or another chip
line=chip.get_line(6)             # <-- replace with an UNUSED line
line.request(consumer="test", type=gpiod.LINE_REQ_DIR_OUT, default_vals=[0])
for i in range(20):
    line.set_value(i&1)
    time.sleep(0.05)
line.set_value(0); line.release(); chip.close()
print("OK")
PY
