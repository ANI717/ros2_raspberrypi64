<p align="center">
  <h1 align="center">ROS 2 Dashing on Raspberry Pi 64</h1>
</p>

Install ROS 2 Dashing on Raspberry Pi 64 Bit (RaspiOS arm64)

## Colaborators
[Computer Fusion Laboratory (CFL) - Temple University College of Engineering](https://sites.temple.edu/cflab/people/)
* [Animesh Bala Ani](https://animeshani.com/)
* [Dr. Li Bai](https://engineering.temple.edu/about/faculty-staff/li-bai-lbai)

## Setup Raspberry Pi 64 Bit (RaspiOS arm64)
Follow instructions from https://github.com/ANI717/headless_raspberrypi_setup

## Setup ROS 2 Dashing from Source
Run following commands.
```
sudo apt install git -y
cd ~ && git clone https://github.com/ANI717/ros2_raspberrypi64
cd ~/ros2_raspberrypi64
chmod +x ros2_setup.sh && ./ros2_setup.sh
. ~/.bashrc
```
