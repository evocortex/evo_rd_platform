#!/bin/bash

###############################################################
# Copyright (C) 2020, Evocortex GmbH, All rights reserved.    #
# Further regulations can be found in LICENSE file.           #
###############################################################

# Get system information
LINUX_DIST_=$(lsb_release -is)
LINUX_CODE_=$(lsb_release -cs)
LINUX_ARCH_=$(uname -m)

# Change to lower case
LINUX_DIST=${LINUX_DIST_,,}
LINUX_CODE=${LINUX_CODE_,,}

# Select correct architecture name
if [ "$LINUX_ARCH_" == "x86_64" ] 
   then
      # Normal PC
      LINUX_ARCH="amd64"
   elif [ "$LINUX_ARCH_" == "armv7l" ]
   then
      # Raspberry Pi
      LINUX_ARCH="armhf"
   elif [ "$LINUX_ARCH_" == "aarch64" ]
   then
      # NVIDIA Tegra
      LINUX_ARCH="arm64"
   else
      LINUX_ARCH=$LINUX_ARCH_
fi

# Generate installation name
DEB_NAME="bin/evo-mbed-tools-*-${LINUX_DIST}-${LINUX_CODE}-${LINUX_ARCH}.deb"

# Print welcome message
echo "*****************************************************"
echo "Update Tool for Evocortex MBED Tools"
echo "*****************************************************"
echo ""
echo "Your System:"
echo "-----------------------------------------------------"
echo "Distribution: ${LINUX_DIST_} ${LINUX_CODE_}"
echo "Architecture: ${LINUX_ARCH_}"
echo "-----------------------------------------------------"
echo ""
echo "Description:"
echo "-----------------------------------------------------"
echo "This application removes the old version of"
echo "Evocortex MBED Tools and replaces it by the version"
echo "found in the bin/ directory"
echo "-----------------------------------------------------"
echo ""
echo "The following commands will be executed with sudo:"
echo "-----------------------------------------------------"
echo "- sudo apt remove -y evo_mbed_tools evo-mbed-tools"
echo "- sudo dpkg -i ${DEB_NAME}"
echo "-----------------------------------------------------"
echo "*****************************************************"
echo ""

# Check for SUDO
if [ "$EUID" -ne 0 ]
  then 
  echo "*****************************************************"
  echo "Please run program with sudo! -> Cancel"
  echo "*****************************************************"
  exit
fi

# Final question
while true; do
    read -p "Do you want to perform the update[y/n]: " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo "Cancel"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo ""
echo "*****************************************************"
echo ""
echo "Removing old library"
echo "-----------------------------------------------------"

# Remove evo_mbed_tools
apt-get remove -y evo_mbed_tools evo-mbed-tools

echo "-----------------------------------------------------"
echo ""
echo "Installing new library"
echo "-----------------------------------------------------"
dpkg -i $DEB_NAME
echo "-----------------------------------------------------"
echo "*****************************************************"
echo ""
echo "*****************************************************"
echo "FINISH"
echo "*****************************************************"


