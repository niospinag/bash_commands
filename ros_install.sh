#!/bin/bash

# Author: Nestor Ospina

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

echo -e "\n${yellowColour}[*]${endColour}${grayColour}Updating${endColour}"
sudo apt update
sudo apt install locales
sudo apt upgrade -y
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
echo locale


echo -e "\n${yellowColour}[*]${endColour}${grayColour}seting up sources${endColour}"
sudo apt install software-properties-common
sudo add-apt-repository universe
sudo apt update && sudo apt install curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null


echo -e "\n${yellowColour}[*]${endColour}${grayColour}Installing ROS2...${endColour}"
if [ "$(cat /etc/issue)" == "Ubuntu 22.04 LTS /n /l" ]; then 
sudo apt install ros-humble-desktop
sudo apt install ros-dev-tools
else
		echo -e "\n${redColour}[*] Este modo de ataque no es válido${endColour}\n"
fi


