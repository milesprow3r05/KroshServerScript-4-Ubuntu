#!/bin/bash
if [ $1 == "" ];
then
  echo "Usage: $0 <directory to install>"
  exit
fi
echo "Apache2, PHP5.6, and MySQL, for manage - Adminer for MySQL"
apt install -y apache2 python-pip software-properties-common nodejs
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install php5.6 php5.6-xml php5.6-gd php5.6-mysql php5.6-sqlite3
cd $1
wget -P $1 https://github.com/vrana/adminer/releases/download/v4.8.0/adminer-4.8.0-mysql.php
wget -P $1 https://github.com/kroshmorkovkin/KroshServerScript-4-Ubuntu/raw/main/adminer.css
mv -f adminer-4.8.0-mysql.php adminer.phtml
a2enmod cgi
a2enmod mime_magic
a2enmod alias
a2enmod rewrite
a2enmod lua
echo "Done"
