#!/bin/bash
# 启动相机
terminator -e "bash -i -c 'cd ~/SLAM/go1_navigation; source devel/setup.bash; roslaunch camera_driver camera_startup.launch; exec bash'"
# 录制 LiDAR 和相机的数据
terminator -e "bash -i -c 'sleep 5; cd ~/SLAM/datasets; rosbag record /unilidar/cloud /unilidar/imu /usb_cam/image_raw/compressed; exec bash'"
# 列出所有 ttyUSB 设备, 启动 UniLidar
terminator -e "bash -i -c 'sleep 5; ls /dev/ttyUSB*; echo \"123\" | sudo -S chmod 777 /dev/ttyUSB0; cd ~/SLAM/go1_navigation/; source devel/setup.bash; roslaunch unitree_lidar_ros run_without_rviz.launch; exec bash'"
# 启动 point_lio_unilidar
terminator -e "bash -i -c 'sleep 5; cd ~/SLAM/go1_navigation; source devel/setup.bash; roslaunch point_lio_unilidar mapping_unilidar.launch; exec bash'"
# 检测 /unilidar/cloud 的频率
terminator -e "bash -i -c 'sleep 5; rostopic hz /unilidar/cloud; exec bash'"
