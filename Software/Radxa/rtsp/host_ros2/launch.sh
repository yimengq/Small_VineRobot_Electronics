#!/bin/bash

# ROS 2 Humble launcher for the base station
# - Starts joy_node
# - Starts host_modified_ros2.py
#
# Notes:
# - No roscore in ROS2.
# - If gnome-terminal is available, it opens separate terminals.
#   Otherwise it runs the processes in the background in this shell.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
HOST_SCRIPT="$SCRIPT_DIR/host_modified_ros2.py"

# Source ROS 2
source /opt/ros/humble/setup.bash

# Optional: source a colcon workspace if present
if [ -f "$SCRIPT_DIR/../install/setup.bash" ]; then
  source "$SCRIPT_DIR/../install/setup.bash"
elif [ -f "$SCRIPT_DIR/install/setup.bash" ]; then
  source "$SCRIPT_DIR/install/setup.bash"
fi

echo "[INFO] Killing existing processes (best-effort)..."
pkill -f "ros2 run joy joy_node" 2>/dev/null || true
pkill -f "host_modified_ros2.py" 2>/dev/null || true
pkill -f "python3 .*host_modified_ros2.py" 2>/dev/null || true
sleep 1

JOY_CMD="source /opt/ros/humble/setup.bash; ros2 run joy joy_node"
HOST_CMD="source /opt/ros/humble/setup.bash; cd \"$SCRIPT_DIR\"; python3 \"$HOST_SCRIPT\""

run_in_terminal_or_bg() {
  local title="$1"; shift
  local cmd="$*"

  if command -v gnome-terminal >/dev/null 2>&1; then
    gnome-terminal --title="$title" -- bash -lc "$cmd; exec bash"
    return 0
  fi

  echo "[WARN] gnome-terminal not found; running '$title' in background."
  bash -lc "$cmd" &
  echo $!
}

echo "[INFO] Starting joy_node..."
JOY_PID=$(run_in_terminal_or_bg "joy_node" "$JOY_CMD") || true

echo "[INFO] Starting host_modified_ros2.py..."
HOST_PID=$(run_in_terminal_or_bg "host_modified_ros2" "$HOST_CMD") || true

# If we launched background jobs (no gnome-terminal), keep this shell alive
# so Ctrl+C can stop them.
if ! command -v gnome-terminal >/dev/null 2>&1; then
  echo "[INFO] Background PIDs: joy=${JOY_PID:-n/a} host=${HOST_PID:-n/a}"
  echo "[INFO] Press Ctrl+C here to stop."

  trap 'echo "[INFO] Stopping..."; kill ${JOY_PID:-} 2>/dev/null || true; kill ${HOST_PID:-} 2>/dev/null || true; exit 0' INT TERM
  while true; do sleep 1; done
fi

