#!/bin/bash
if [ "$1" = "" ];
then
	echo -e "\033[94mUsage: \033[97m$0 <directory to install>"
	exit
fi
echo -e "\033[97mApache2, PHP5.6, and MySQL, for manage - Adminer for MySQL"
echo "by kroshmorkovkin"
sudo apt install -y apache2 mysql-server neofetch screenfetch python-pip software-properties-common nodejs
sudo mysql_secure_installation
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install -y php5.6 php5.6-xml php5.6-gd php5.6-mysql php5.6-sqlite3 php5.6-curl php5.6-opcache php5.6-json php5.6-xmlrpc
sudo add-apt-repository ppa:certbot/certbot
sudo apt update
sudo apt install certbot
sudo certbot run --apache
cd $1
wget -P $1  https://www.adminer.org/latest-mysql.php
wget -P $1 https://github.com/kroshmorkovkin/KroshServerScript-4-Ubuntu/raw/main/adminer.css
wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb
sudo dpkg -i mod-pagespeed-*.deb
sudo apt -f install
sudo rm mod-pagespeed-*.deb
mv -f adminer-*.php adminer.phtml
sudo a2enmod status
sudo a2enmod info
sudo a2enmod cgi
sudo a2enmod mime_magic
sudo a2enmod alias
sudo a2enmod rewrite
sudo a2enmod lua
sudo systemctl restart apache2
echo -e "\033[92mDone!\033[97m"
