sudo chmod +x cleanJob.sh
mv ./cleanJob.sh ~/
mv ./cleanupImages.py ~/
mv ./rebootServerComputeEngine.sh ~/
crontab -l > mycron
#echo new cron into cron file
echo "* * * * * ./cleanJob.sh" >> mycron
echo "@reboot ./rebootServerComputeEngine.sh" >> mycron
#install new cron file
crontab mycron
rm mycron
