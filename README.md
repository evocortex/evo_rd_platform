# evo_rd_platform

The evo_rd_platform repository contains multiple branches, which are used for versioning:
-	Master: Unreleased version of repositories with new features
-	vX.Y.Z: Branch containing released versions X.Y.Z

## Install development version

Install the latest not released version via the master-branch of the repository.

**Clone Repository**
```
cd /home/nvidia/catkin-ws/src
git clone https://github.com/evocortex/evo_rd_platform.git
```

**Install evo-mbed-tools**

There are two ways to install the evo-mbed-tools:

```
# 1. Method: Installation by hand (see bin/README.md for details)
sudo dpkg -i bin/evo-mbed-tools-***.deb

# 2. Method: Installation via script
sudo ./update-evo-tools.sh
```

**Update workspace**
```
wstool update
```

**Build workspace**
```
cd  /home/nvidia/catkin-ws
catkin build
```

## Install release version

If you want to install a specific version e.g. **v1.1.0**:
```
# Clone Repository to your catkin workspace
cd /home/nvidia/catkin-ws/src
git clone https://github.com/evocortex/evo_rd_platform.git

# Checkout required version
git checkout v1.1.0 # This is only an example and must not work

# Update evo-mbed-tools with one of the two methods described below:

# 1. Method: Update by hand (see bin/README.md for details)
sudo apt remove evo-mbed-tools evo_mbed_tools # Remove old version (if there are erros you can ignore them)
sudo dpkg -i bin/evo-mbed-tools-***.deb # Install new version

# 2. Method: Installation via script
sudo ./update-evo-tools.sh

# Update workspace
wstool update

# Build workspace
cd  /home/nvidia/catkin-ws
catkin build
```
## Update development version

You can update the development version with the example shown below. Please be aware that a update will only succeed if your sub-repositories are clean. You have to stash all changes in all sub-repos downloaded by this tool. A update of your launch files and settings shall be performed before stashing the changes, otherwise they are lost.

```
# Go to installation directory
cd /home/nvidia/catkin-ws/src/evo_rd_platform

# Pull latest version
git pull origin master

# Update sub-repositories (take care that they are "clean")
wstool update

# Update evo-mbed-tools with one of the two methods described below:

# 1. Method: Update by hand (see bin/README.md for details)
sudo apt remove evo-mbed-tools evo_mbed_tools # Remove old version (if there are erros you can ignore them)
sudo dpkg -i bin/evo-mbed-tools-***.deb # Install new version

# 2. Method: Installation via script
sudo ./update-evo-tools.sh

# Build workspace
cd  /home/nvidia/catkin-ws
catkin build
```

Please take care that this will only work if you don't have any changes in the repositories.
If you changed a file the repository containing it will not be updated!

## Upgrade released version

You can switch your released version e.g. from 1.2.0 to 2.0.0 by simply changing the branch of this repository.
Please be aware that a upgrade will only succeed if your sub-repositories are clean. You have to stash all changes in all sub-repos downloaded by this tool. A update of your launch files and settings shall be performed before stashing the changes, otherwise they are lost.

```
# Go to installation directory
cd /home/nvidia/catkin-ws/src/evo_rd_platform

# Get all versions
git fetch --all

# Checkout your desired version
git checkout v2.3.0 # This is only an example and must not work

# Update sub-repositories (take care that they are "clean")
wstool update

# Update evo-mbed-tools with one of the two methods described below:

# 1. Method: Update by hand (see bin/README.md for details)
sudo apt remove evo-mbed-tools evo_mbed_tools # Remove old version (if there are erros you can ignore them)
sudo dpkg -i bin/evo-mbed-tools-***.deb # Install new version

# 2. Method: Installation via script
sudo ./update-evo-tools.sh

# Build workspace
cd  /home/nvidia/catkin-ws
catkin build
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
- **v1.0.0**: This was the first released version. The install process differs from the one described above. Please follow the instructions in the README if v1.0.0 is checked out.

- **v1.0.0 to v1.1.0**: Please be aware that the naming of the **Evocortex Embedded Library** has changed from **evo_mbed_tools** to **evo-mbed-tools**. You have to uninstall evo_mbed_tools from your system and reinstall evo-mbed-tools to be able to build your application! Alternativly use the update-evo-tools script.
