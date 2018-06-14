#!/bin/bash

for i in "$@"
do
case $i in
    -r=*|--repo=*)
    REPO_URL="${i#*=}"
    shift
    ;;
esac
done
echo "REPO  = ${REPO_URL}"

BASEDIR=${PWD}

cd ~/
if [[ -d "Aggregator" ]]; then
    echo "In project Directory"
 sudo rm -rf Aggregator
 fi

cd ~/
git clone ${REPO_URL}/Aggregator

sudo apt-get install git cmake curl aptitude
sudo apt-get install -y python-pip
sudo pip install simplejson requests

#Install NodeJS
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

#Install forever
sudo npm install -y forever -g

sudo apt-get install gir1.2-gstreamer-1.0 gstreamer-tools gstreamer1.0-alsa gstreamer1.0-clutter gstreamer1.0-clutter-3.0 gstreamer1.0-fluendo-mp3 gstreamer1.0-nice gstreamer1.0-plugins-bad gstreamer1.0-plugins-bad-faad gstreamer1.0-plugins-bad-videoparsers gstreamer1.0-plugins-base gstreamer1.0-plugins-base-apps gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-plugins-ugly-amr gstreamer1.0-pulseaudio gstreamer1.0-tools gstreamer1.0-x libgstreamer-plugins-bad1.0-0 libgstreamer-plugins-base1.0-0 libgstreamer-plugins-good1.0-0 libgstreamer1.0-0 libgstreamer1.0-dev libreoffice-avmedia-backend-gstreamer  gstreamer1.0-libav

#Install openCV
cd ${BASEDIR}
sudo chmod u+x installOpenCVAggregator.sh
mv installOpenCVAggregator.sh ~/
cd ~/
./installOpenCVAggregator.sh

#Install Aggregator

cd ~/Aggregator
npm run pythonPackages
npm install

#add reboot and delete images cron
cd ${BASEDIR}
sudo chmod +x addCronAggregator.sh
./addCronAggregator.sh

#Keygen
cd ~/
ssh-keygen 
echo "Aggregator Installation is done.."






