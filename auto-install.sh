#!/bin/bash -ex

# installation for ubuntu 18

REPO_USER='' #fill-with-user
REPO_PW='' #fill-with-pw

sudo apt install python-wstool
sudo apt install apt-transport-https
sudo apt install ros-melodic-rosbash

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
  wget -O - https://${REPO_USER}:${REPO_PW}@repo.evocortex.org:/apt/ubuntu/conf/evocortex.gpg.key | sudo apt-key add -
  sudo sh -c 'echo "deb https://repo.evocortex.org:/apt/ubuntu $(lsb_release -sc) main non-free" > /etc/apt/sources.list.d/evocortex.list'
  sudo sh -c "echo "'machine repo.evocortex.org login '${REPO_USER}' password '${REPO_PW}" > /etc/apt/auth.conf.d/evocortex.conf"
  sudo apt update
  sudo apt install -y ros-melodic-evo-tsd-slam ros-melodic-evo-localizer ros-melodic-evo-elm-dcdc ros-melodic-evo-elm-boxed-launch ros-melodic-bluefox2
fi

# adapt kp ki can_interface_name wheel_radius_in_m wheel_distance_front_back_in_m wheel_distance_left_right_in_m (rosed evo_rd_platform_example evo_base_driver.launch)
# run sudo jetson_clocks
# run can_init.sh in ~/ws/catkin-ws/src/evo_rd_platform/evo_rd_platform_example/scripts
# run e.g. roslaunch evo_rd_platform_example evo_base_driver.launch
# publish /cmd_vel to move robot

