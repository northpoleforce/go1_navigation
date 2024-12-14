# Installation and Setup Guide

## Install Dependencies
```bash
# Camera dependencies
sudo apt install ros-melodic-usb-cam
sudo apt install ros-melodic-image-view
sudo apt-get install ros-melodic-image-transport-plugins

# Additional dependencies
sudo apt install ros-melodic-pcl-conversions libeigen3-dev
sudo apt-get install ros-melodic-eigen-conversions
sudo apt install ros-melodic-move-base*
sudo apt install ros-melodic-rviz*
```

## Bind Camera
1. Run the following command to check the `idVendor` value of your device:
   ```bash
   udevadm info --name=/dev/video0 --attribute-walk
   ```

2. Use the following format to create a symbolic link `/dev/mycamera` for a specific camera. This ensures that the camera can always be accessed via `/dev/mycamera`, regardless of other conditions.

3. Edit the rules file:
   ```bash
   sudo nano /etc/udev/rules.d/99-usb-camera.rules
   ```

4. Add the following lines to define symbolic links for specific cameras:
   ```bash
   SUBSYSTEM=="video4linux", ATTR{name}=="HIK 2K Camera", KERNEL=="video[0-9]*", SYMLINK+="mycamera"

   SUBSYSTEM=="video4linux", ATTR{name}=="GENERAL WEBCAM", KERNEL=="video[0-9]*", SYMLINK+="mycamera"
   ```

## Build the Code
Use the provided script to compile the code:
```bash
./scripts/build.bash
