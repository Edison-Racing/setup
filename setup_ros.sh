cd ./setup_materials/
git clone https://github.com/ncnynl/installROSXavier
cd ../
cd ./setup_materials/installROSXavier
./installROS.sh -p ros-melodic-desktop
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
cd ../
