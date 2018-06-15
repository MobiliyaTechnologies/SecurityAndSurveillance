#!/bin/bash

BASEDIR=${PWD}

sudo apt-get install git cmake curl aptitude

cd ~/
if [[ -d "Aggregator" ]]; then
    echo "In project Directory"
 sudo rm -rf Aggregator
 fi

cd ~/
git clone https://snsguest:Mobgit12%21%40@github.com/MobiliyaTechnologies/Aggregator
if [ "$?" -eq "0" ]
then
echo -e "Aggregator clone success"
else
	exit 1;
fi

sudo apt-get install -y python-pip
sudo pip install simplejson requests

#Install NodeJS
echo -e "\n*************Installing NodeJs"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

#Install forever
sudo npm install -y forever -g

echo -e "\n*************Installing Gstreamer Plugins"
sudo apt-get install -y gir1.2-gstreamer-1.0 gstreamer-tools gstreamer1.0-alsa gstreamer1.0-clutter gstreamer1.0-clutter-3.0 gstreamer1.0-fluendo-mp3 gstreamer1.0-nice gstreamer1.0-plugins-bad gstreamer1.0-plugins-bad-faad gstreamer1.0-plugins-bad-videoparsers gstreamer1.0-plugins-base gstreamer1.0-plugins-base-apps gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-plugins-ugly-amr gstreamer1.0-pulseaudio gstreamer1.0-tools gstreamer1.0-x libgstreamer-plugins-bad1.0-0 libgstreamer-plugins-base1.0-0 libgstreamer-plugins-good1.0-0 libgstreamer1.0-0 libgstreamer1.0-dev libreoffice-avmedia-backend-gstreamer  gstreamer1.0-libav

#Install openCV
echo -e "\n*************Installing OpenCV"
cd ${BASEDIR}
sed -i -e 's/\r$//' installOpenCVAggregator.sh
sudo chmod u+x installOpenCVAggregator.sh
mv installOpenCVAggregator.sh ~/
cd ~/
./installOpenCVAggregator.sh

#Install Aggregator
echo -e "\n********0*****Installing Aggregator"
cd ~/Aggregator
sudo chmod +x fisheye2pano
npm install

#add reboot and delete images cron
cd ${BASEDIR}
sed -i -e 's/\r$//' addCronAggregator.sh
sudo chmod +x addCronAggregator.sh
./addCronAggregator.sh

#Keygen
cd ~/
echo -e "\n*****---------------------Please press ENTER key whenever asked to enter something"
ssh-keygen 
echo -e "\n*****---------------------Aggregator Installation is done..Please do configurations mentioned in setup documentation!!"
