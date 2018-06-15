sed -i -e 's/\r$//' cleanJob.sh
sed -i -e 's/\r$//' rebootServerAggregator.sh
sudo chmod +x cleanJob.sh
sudo chmod +x rebootServerAggregator.sh
mv ./cleanJob.sh ~/
mv ./cleanupImages.py ~/
mv ./rebootServerAggregator.sh ~/
crontab -l > mycron
#echo new cron into cron file
echo "* * * * * ./cleanJob.sh" >> mycron
echo "@reboot ./rebootServerAggregator.sh" >> mycron
#install new cron file
crontab mycron
rm mycron
