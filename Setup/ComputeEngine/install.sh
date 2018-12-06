#!/bin/bash

BASE_DIR=${PWD}

sudo apt-get install -y git cmake curl aptitude

cd ~/
if [[ -d "ComputeEngine" ]]; then
    echo "In project Directory"
 sudo rm -rf ComputeEngine
 fi

git clone -b xavierboard https://snsguest:Mobgit12%21%40@github.com/MobiliyaTechnologies/ComputeEngine
if [ "$?" -eq "0" ]
then
echo -e "\n*************ComputeEngine clone success"
else
	exit 1;
fi

echo -e "\n*************Adding cron"
cd ${BASE_DIR}
sed -i -e 's/\r$//' addCron.sh 
sudo chmod +x addCron.sh
./addCron.sh
cd ~/

#Install NodeJS
echo -e "\n*************Installing NodeJs"
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt-get install -y nodejs

#Install JSON for C
sudo apt-get install -y libjson0 libjson0-dev
sudo apt-get install -y libjson0-dbg
sudo apt-get install libjson-c-dev

#Install Curl library
sudo apt-get install -y libcurl4-gnutls-dev

#Install forever
sudo npm install -y forever -g

#Installation of opencv-3.2.0
sudo aptitude purge -y libopencv4tegra-python libopencv4tegra-dev libopencv4tegra
sudo aptitude purge -y libopencv4tegra-repo
sudo apt-get purge -y python-numpy
sudo apt autoremove -y
sudo apt-get install -y gir1.2-gstreamer-1.0 gstreamer-tools gstreamer1.0-alsa gstreamer1.0-clutter gstreamer1.0-clutter-3.0 gstreamer1.0-fluendo-mp3 gstreamer1.0-nice gstreamer1.0-plugins-bad gstreamer1.0-plugins-bad-faad gstreamer1.0-plugins-bad-videoparsers gstreamer1.0-plugins-base gstreamer1.0-plugins-base-apps gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-plugins-ugly-amr gstreamer1.0-pulseaudio gstreamer1.0-tools gstreamer1.0-x libgstreamer-plugins-bad1.0-0 libgstreamer-plugins-base1.0-0 libgstreamer-plugins-good1.0-0 libgstreamer1.0-0 libgstreamer1.0-dev libreoffice-avmedia-backend-gstreamer  gstreamer1.0-libav

#OpenCV Installation
echo -e "\n*************Installing OpenCV"
cd ${BASE_DIR}
sed -i -e 's/\r$//' buildOpenCV.sh
sudo chmod u+x buildOpenCV.sh
./buildOpenCV.sh
cd ~/opencv/build
sudo make install 

echo -e "\n*************Installing base64 library"
cd ${BASE_DIR}
cd ./base64-simple
make
sudo make install

#Installation of project 
echo -e "\n*************Let's install Compute Engine"
cd ~/ComputeEngine/darknet
echo -e "\n*************Downloading Model weights"
wget https://pjreddie.com/media/files/yolo.weights
make -j4
cd  ~/ComputeEngine/jetsonNodeServer
echo -e "\n*************Installing Node Server"
sudo npm install

echo "Compute Engine Installation is done..Do the configuration in settings.js file"
