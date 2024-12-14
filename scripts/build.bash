#!/bin/bash

# Exit on error
set -e

# Get absolute path of script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change to workspace root directory (assuming script is in scripts folder)
cd "$SCRIPT_DIR/.."

# Output current build status
echo "Building workspace..."

# Choose build command based on ROS version
if [ -f "/opt/ros/noetic/setup.bash" ]; then
    # ROS1 Noetic
    source /opt/ros/noetic/setup.bash
    # 获取CPU核心数并设置作业数为核心数减2
    CORES=$(nproc)
    JOBS=$((CORES - 2))
    # 确保至少使用1个核心
    JOBS=$(( JOBS < 1 ? 1 : JOBS ))
    catkin_make -j${JOBS}
elif [ -f "/opt/ros/humble/setup.bash" ]; then
    # ROS2 Humble
    source /opt/ros/humble/setup.bash
    colcon build
else
    echo "Error: ROS environment not found, please make sure ROS is installed"
    exit 1
fi

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "Build successful!"
    
    # Source setup suggestion
    if [ -f "devel/setup.bash" ]; then
        echo "Please run: source devel/setup.bash"
    elif [ -f "install/setup.bash" ]; then
        echo "Please run: source install/setup.bash"
    fi
else
    echo "Build failed!"
    exit 1
fi