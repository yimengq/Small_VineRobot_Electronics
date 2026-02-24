#!/usr/bin/env bash
set -euo pipefail

try_pwm() {
  local CHIP="$1" CHAN=0
  local BASE="/sys/class/pwm/pwmchip${CHIP}"
  echo "== Testing pwmchip${CHIP}/pwm${CHAN} =="

  if [[ ! -d "$BASE" ]]; then
    echo "  pwmchip${CHIP} not present"
    return 1
  fi

  # Export if needed
  if [[ ! -d "$BASE/pwm${CHAN}" ]]; then
    echo "${CHAN}" | sudo tee "$BASE/export" >/dev/null || { echo "  export failed"; return 1; }
    sleep 0.05
  fi

  # Be sure it’s disabled before programming
  echo 0 | sudo tee "$BASE/pwm${CHAN}/enable" >/dev/null || true

  # Optional: show polarity support
  if [[ -f "$BASE/pwm${CHAN}/polarity" ]]; then
    echo -n "  polarity: "
    cat "$BASE/pwm${CHAN}/polarity"
  fi

  # Program period (20ms → 50Hz) then duty (start at 0)
  echo 20000000 | sudo tee "$BASE/pwm${CHAN}/period" >/dev/null || { echo "  set period failed"; return 1; }
  echo        0 | sudo tee "$BASE/pwm${CHAN}/duty_cycle" >/dev/null || { echo "  set duty failed"; return 1; }

  # Enable
  echo 1 | sudo tee "$BASE/pwm${CHAN}/enable" >/dev/null || { echo "  enable failed"; return 1; }
  echo "  enabled OK → sweeping 0..50% duty"

  # Sweep a few cycles
  for rep in {1..3}; do
    for us in 0 1000000 2000000 3000000 4000000 5000000; do
      echo $us | sudo tee "$BASE/pwm${CHAN}/duty_cycle" >/dev/null
      printf "    duty=%5.1f%%\n" "$(awk "BEGIN{print ($us/20000000)*100}")"
      sleep 0.3
    done
  done

  # Clean up
  echo 0 | sudo tee "$BASE/pwm${CHAN}/enable" >/dev/null
  echo "${CHAN}" | sudo tee "$BASE/unexport" >/dev/null
  echo "  OK on pwmchip${CHIP}/pwm${CHAN}"
  return 0
}

try_pwm 0 || echo ">> pwmchip0 failed (see messages above)"
try_pwm 1 || echo ">> pwmchip1 failed (see messages above)"
