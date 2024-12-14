#!/bin/bash
# 启动相机
terminator -e "bash -i -c 'cd ~/SLAM/go1_navigation; source devel/setup.bash; roslaunch camera_driver camera_startup.launch; exec bash'"
# 录制 LiDAR 和相机的数据
terminator -e "bash -i -c 'sleep 5; cd ~/SLAM/datasets; rosbag record /livox/lidar /livox/imu /usb_cam/image_raw/compressed; exec bash'"
# 列出所有 ttyUSB 设备, 启动 mid360
terminator -e "bash -i -c 'sleep 5; cd ~/SLAM/go1_navigation/; source devel/setup.bash; roslaunch livox_ros_driver2 msg_mid360.launch; exec bash'"
# 启动 point_lio
terminator -e "bash -i -c 'sleep 5; cd ~/SLAM/go1_navigation; source devel/setup.bash; roslaunch point_lio mapping_mid360.launch; exec bash'"
# 检测 /livox/lidar 的频率
terminator -e "bash -i -c 'sleep 5; rostopic hz /livox/lidar; exec bash'"
