# evo_rd_platform

The evo_rd_platform repository contains multiple branches, which are used for versioning:
-	Master: Unreleased version of repositories with new features
-	vX.Y.Z: Branch containing released versions X.Y.Z

If you want to have the newest version you can initialize your repository with the master branch:
```
# Installation of master branch

# Clone Repository to your catkin workspace
cd /home/nvidia/catkin-ws/src
git clone https://github.com/evocortex/evo_rd_platform.git

# Install evo-mbed-tools for your system and architecture
sudo dpkg -i bin/evo-mbed-tools-***.deb # Use your required install file
wstool update

# Build your workspace
cd  /home/nvidia/catkin-ws
catkin build
```

If you want to install a specific version e.g. **v1.0.0**:
```
# Installation of master branch

# Clone Repository to your catkin workspace
cd /home/nvidia/catkin-ws/src
git clone https://github.com/evocortex/evo_rd_platform.git

# Checkout required version
git checkout v1.0.0

# Install evo-mbed-tools for your system and architecture
sudo dpkg -i bin/evo-mbed-tools-***.deb # Use your required install file
wstool update

# Build your workspace
cd  /home/nvidia/catkin-ws
catkin build
```

## Updates

If you want to update an old version with a new version take care to uninstall the evo-mbed-tools and replace it with the new version:

```
# Update from v1.0.0
sudo apt remove evo_mbed_tools

Update from newer versions
sudo apt remove evo-mbed-tools

# Install
sudo dpkg -i bin/evo-mbed-tools-***.deb

```

# Run your application

```
# Modify the USB-2-CAN Adapter path in your launch-files
cd /home/nvidia/catkin-ws/src/evo_rd_platform/evo_rd_platform_example/launch

# Init environment (usb-2-can) with the available scripts
/home/nvidia/catkin-ws/src/evo_rd_platform/evo_rd_platform_example/

# Source your workspace
source /home/nvidia/catkin-ws/devel/setup.bash

# Run required launch files
roslaunch evo_rd_platform_examples evo_***.launch
```

# Notes

- **v1.0.0 to v1.1.0**: Please be aware that the naming of the **Evocortex Embedded Library** has changed from **evo_mbed_tools** to **evo-mbed-tools**. You have to uninstall evo_mbed_tools from your system and reinstall evo-mbed-tools to be able to build your application!