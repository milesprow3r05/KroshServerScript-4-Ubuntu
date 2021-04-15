#!/bin/bash
if [ $1 == "" ];
then
  echo "Usage: $0 <directory to install>"
  exit
fi
echo "Apache2, PHP5.6, and MySQL, for manage - Adminer for MySQL"
apt install -y apache2 mysql-server neofetch screenfetch python-pip software-properties-common nodejs
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install -y php5.6 php5.6-xml php5.6-gd php5.6-mysql php5.6-sqlite3 php5.6-curl php5.6-opcache php5.6-json php5.6-xmlrpc php5.6-xmlrpc
sudo add-apt-repository ppa:certbot/certbot
sudo apt update
sudo apt install certbot
sudo certbot run --apache
cd $1
wget -P $1 https://github.com/vrana/adminer/releases/download/v4.8.0/adminer-4.8.0-mysql.php
wget -P $1 https://github.com/kroshmorkovkin/KroshServerScript-4-Ubuntu/raw/main/adminer.css
wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb
sudo dpkg -i mod-pagespeed-*.deb
sudo apt -f install
sudo systemctl restart apache2
mv -f adminer-4.8.0-mysql.php adminer.phtml
a2enmod status
a2enmod info
a2enmod cgi
a2enmod mime_magic
a2enmod alias
a2enmod rewrite
a2enmod lua
echo "Done"