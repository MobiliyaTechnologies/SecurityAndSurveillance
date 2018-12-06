#!/bin/bash
AGGREGATOR_BRANCH='jetson-only'
COMPUTEENGINE_BRANCH='xavierboard'
BASE_DIR=${PWD}

cd ~/
sudo apt-get install -y git cmake curl aptitude
git clone -b ${COMPUTEENGINE_BRANCH} https://snsguest:Mobgit12%21%40@github.com/MobiliyaTechnologies/ComputeEngine
git clone -b ${AGGREGATOR_BRANCH}  https://snsguest:Mobgit12%21%40@github.com/MobiliyaTechnologies/Aggregator 

#Install NodeJS
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt-get install -y nodejs

sudo apt-get install -y python-pip
sudo pip install simplejson requests
#Install JSON for C
sudo apt-get install -y libjson0 libjson0-dev
sudo apt-get install -y libjson0-dbg

#Install Curl library
sudo apt-get install -y libcurl4-gnutls-dev

#Install forever
sudo npm install -y forever -g

#Installation of opencv-3.2.0
sudo apt-get purge -y libopencv4tegra-python libopencv4tegra-dev libopencv4tegra
sudo apt-get purge -y libopencv4tegra-repo
sudo apt-get purge -y python-numpy
sudo apt autoremove -y
sudo apt-get install -y gir1.2-gstreamer-1.0 gstreamer-tools gstreamer1.0-alsa gstreamer1.0-clutter gstreamer1.0-clutter-3.0 gstreamer1.0-fluendo-mp3 gstreamer1.0-nice gstreamer1.0-plugins-bad gstreamer1.0-plugins-bad-faad gstreamer1.0-plugins-bad-videoparsers gstreamer1.0-plugins-base gstreamer1.0-plugins-base-apps gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-plugins-ugly-amr gstreamer1.0-pulseaudio gstreamer1.0-tools gstreamer1.0-x libgstreamer-plugins-bad1.0-0 libgstreamer-plugins-base1.0-0 libgstreamer-plugins-good1.0-0 libgstreamer1.0-0 libgstreamer1.0-dev libreoffice-avmedia-backend-gstreamer  gstreamer1.0-libav

cd ${BASE_DIR}
cd ./base64-simple
make
sudo make install

#OpenCV Installation
cd ../
sudo chmod u+x buildOpenCV.sh
./buildOpenCV.sh
cd ~/opencv/build
sudo make install 

#Installation of project 
cd ~/Aggregator
chmod +x fisheye2pano
npm install > opencvInstall.txt
cd ~/ComputeEngine/darknet
wget https://pjreddie.com/media/files/yolo.weights
make -j6
cd  ~/ComputeEngine/jetsonNodeServer
sudo npm install

cd ${BASE_DIR}
sudo chmod +x addCron.sh
./addCron.sh
cd ~/
echo "Installation is done! Please do configurations now!"
