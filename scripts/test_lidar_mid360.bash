#!/bin/bash
#  启动 mid360 
terminator -e "bash -i -c 'cd ~/SLAM/go1_navigation/; source devel/setup.bash; roslaunch livox_ros_driver2 rviz_MID360.launch; exec bash'"
# 检测 /livox/lidar 的频率
terminator -e "bash -i -c 'sleep 5; rostopic hz /livox/lidar; exec bash'"
