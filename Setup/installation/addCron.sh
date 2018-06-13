sudo chmod +x cleanJob.sh
sudo chmod +x rebootServerJetson.sh
mv ./cleanJob.sh ~/
mv ./cleanupImages.py ~/
mv ./rebootServerJetson.sh ~/ 
crontab -l > mycron
#echo new cron into cron file
echo "* * * * * ./cleanJob.sh" >> mycron
echo "@reboot ./rebootServerJetson.sh" >> mycron
#install new cron file
crontab mycron
rm mycron
