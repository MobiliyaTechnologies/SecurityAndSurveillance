sudo chmod +x rebootServerJetson.sh
mv ./rebootServerJetson.sh ~/ 
crontab -l > mycron
#echo new cron into cron file
echo "@reboot ./rebootServerJetson.sh" >> mycron
#install new cron file
crontab mycron
rm mycron
