#!/bin/bash
# 列出所有 ttyUSB 设备, 启动 UniLidar
terminator -e "bash -i -c 'ls /dev/ttyUSB*; echo \"123\" | sudo -S chmod 777 /dev/ttyUSB0; cd ~/SLAM/go1_navigation/; source devel/setup.bash; roslaunch unitree_lidar_ros run.launch; exec bash'"
# 检测 /unilidar/cloud 的频率
terminator -e "bash -i -c 'sleep 5; rostopic hz /unilidar/cloud; exec bash'"