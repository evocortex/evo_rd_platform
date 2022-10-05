#!/bin/bash -ex

# installation for ubuntu 18

# fill-with-user
REPO_USER=''

# fill-with-pw
REPO_PW='' 

# fill with purchased apt repo modules
# for ELM: elm-tx2
# for localizer: localizer mapper
# for slam: mapper
NONFREE_MODULES='' 

# fill with purchased apt packages
# for ELM: "ros-melodic-evo-elm-boxed-launch"
# for localizer and slam: ros-melodic-evo-tsd-slam ros-melodic-evo-localizer
NONFREE_PACKAGES='' 

# --- start script

# update ros key
sudo apt install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# install additional software
sudo apt install -y mosquitto libmosquitto1 libc-ares2
sudo apt install -y python-wstool
sudo apt install -y apt-transport-https
sudo apt install -y ros-melodic-rosbash
sudo apt install -y ros-melodic-twist-mux
sudo apt install -y ros-melodic-sick-scan
sudo apt install -y ros-melodic-move-base ros-melodic-global-planner ros-melodic-teb-local-planner
sudo apt install -y ros-melodic-joy-teleop ros-melodic-joy

echo 'source /opt/ros/melodic/setup.bash' >> ~/.bashrc
echo 'source ~/ws/catkin-ws/devel/setup.bash' >> ~/.bashrc

source /opt/ros/melodic/setup.bash
mkdir -p ~/ws/catkin-ws/src
cd ~/ws/catkin-ws/src
catkin_init_workspace
cd ~/ws/catkin-ws/
catkin build
source ~/ws/catkin-ws/devel/setup.bash
cd ~/ws/catkin-ws/src
git clone https://github.com/evocortex/evo_rd_platform.git
cd ~/ws/catkin-ws/src/evo_rd_platform
sudo ./update-evo-tools.sh
wstool update
cd ~/ws/catkin-ws/
catkin build || source ~/ws/catkin-ws/devel/setup.bash && catkin build

if [ -n "$REPO_PW" ] && [ -n "$REPO_USER" ]
 then
  wget -O - https://apt.evocortex.org/evocortex.gpg.key | sudo apt-key add -
  sudo sh -c 'echo "deb https://apt.evocortex.org:/release $(lsb_release -sc) '${NONFREE_MODULES}" > /etc/apt/sources.list.d/evocortex.list'
  sudo sh -c "echo "'machine apt.evocortex.org login '${REPO_USER}' password '${REPO_PW}" > /etc/apt/auth.conf.d/evocortex.conf"
  sudo apt update
  sudo apt install -y $NONFREE_PACKAGES
fi

# next steps:
# adapt kp ki gear_ratio encoder_res can_interface_name wheel_radius_in_m wheel_distance_front_back_in_m wheel_distance_left_right_in_m (rosed evo_rd_platform_example evo_base_driver.launch)
# run "sudo nvpmodel -m 0" to set power mode
# run "sudo jetson_clocks" to overclock system (required for ELM)
# run "sudo ./can_init_quasar.sh" in ~/ws/catkin-ws/src/evo_rd_platform/evo_rd_platform_example/scripts
# run e.g. roslaunch evo_rd_platform_example evo_base_driver.launch
# publish /cmd_vel to move robot

# know issues:
#  - If ssh connection fails with timeout the line "IPQoS cs0 cs0" at the end of /etc/ssh/sshd_config may help
#

