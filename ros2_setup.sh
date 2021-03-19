#!/bin/bash
# Install ROS 2 Dashing on Raspberry Pi 64 Bit (RaspiOS arm64)
# Animesh Ani (ANI717)
# Ref: https://docs.ros.org/en/dashing/Installation/Linux-Development-Setup.html

cd ~
sudo apt update

# Sets locale
sudo apt install locales
sudo locale-gen en_GB.UTF-8
sudo update-locale LC_ALL=en_GB.UTF-8 LANG=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LANGUAGE=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

# Adds the ROS 2 apt repository
sudo apt install curl gnupg2 lsb-release -y
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# Adds the repository to sources list
sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'

echo "export PATH=\"/home/pi/.local/bin:$PATH\"" >> ~/.bashrc

# Installs development tools and ROS tools
sudo apt install -y build-essential cmake git python3-colcon-common-extensions python3-pip python-rosdep python3-vcstool wget
python3 -m pip install -U argcomplete flake8 flake8-blind-except flake8-builtins flake8-class-newline flake8-comprehensions flake8-deprecated
python3 -m pip install -U flake8-docstrings flake8-import-order flake8-quotes pytest-repeat pytest-rerunfailures pytest pytest-cov pytest-runner setuptools
sudo apt install --no-install-recommends -y libasio-dev libtinyxml2-dev libcunit1-dev

# Gets ROS 2 code and installs dependencies from sourcce
mkdir -p ~/ros2_dashing/src
cd ~/ros2_dashing
wget https://raw.githubusercontent.com/ros2/ros2/dashing/ros2.repos
vcs import src < ros2.repos

sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro dashing -y --skip-keys "console_bridge fastcdr fastrtps libopensplice67 libopensplice69 rti-connext-dds-5.3.1 urdfdom_headers"

# Build ROS 2
cd ~/ros2_dashing/
colcon build --symlink-install

# Source the setup script
echo ". ~/ros2_dashing/install/setup.bash" >> ~/.bashrc
