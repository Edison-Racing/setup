# Use tsinghua sources instead of foreign ones
if [ -f "/etc/apt/sources.list.backup" ];then
        echo updating sources: /etc/apt/sources.list.backup already exist.
else
        sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
fi
sudo cp ./setup_materials/source.list /etc/apt/sources.list
sudo cp ./setup_materials/fstab /etc/
sudo mount /dev/nvme0n1p1 /home/edison/workspace

# Install some packages
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install curl
sudo apt-get install openssh-client
sudo apt-get install openssh-server
sudo apt install lm-sensors
sudo apt-get install python-pip
sudo -H pip install jetson-stats

sudo apt-get update
sudo apt-get autoremove
sudo apt --fix-broken install
sudo apt-get upgrade

# Start fan
sudo sh -c "echo 100 > /sys/devices/pwm-fan/target_pwm"
sudo cp ./setup_materials/fan_ctrl_* /usr/local/bin/

# Set nvpmodel
sudo nvpmodel -m 3

# Setup ros
./setup_ros.sh
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0CC3FD642696BFC8
sudo gpg --keyserver keyserver.ubuntu.com --recv-keys 0CC3FD642696BFC8
sudo gpg --export --armor 0CC3FD642696BFC8 | sudo apt-key add -

# Install Vitual Studio Code
sudo dpkg -i ./setup_materials/code-oss_1.32.0-1550644676_arm64.deb
sudo apt-get update
sudo apt-get upgrade
sudo apt --fix-broken install
sudo apt-get autoremove

# Install Google Pinyin (which is awful....)
sudo ./setup_pinyin.sh

