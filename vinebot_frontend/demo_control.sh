#!/bin/bash

# Exit script on any error
set -e

# Get the directory of this script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source ROS
source /opt/ros/noetic/setup.bash

# Kill existing processes
echo "[INFO] Killing existing processes..."
pkill -f roscore || true
pkill -f joy_node || true
pkill -f base_station.py || true
pkill -f controller.py || true

sleep 3

# Start roscore in the background
echo "[INFO] Starting roscore..."
roscore &
ROSCORE_PID=$!
sleep 3

# Start joy_node in a new terminal
echo "[INFO] Starting joy_node..."
gnome-terminal -- bash -c "source /opt/ros/noetic/setup.bash && rosrun joy joy_node"

# Start inpipe_visualization.py in a new terminal
echo "[INFO] Starting inpipe_visualization.py..."
gnome-terminal -- bash -c "source /opt/ros/noetic/setup.bash && cd \"$SCRIPT_DIR\" && python3 inpipe_visualization.py; exec bash"

wait $ROSCORE_PID
