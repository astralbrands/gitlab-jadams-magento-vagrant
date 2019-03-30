PHPVER=`cat  /home/vagrant/deployment/configs/phpversion`
echo "Install Composer"
wget https://getcomposer.org/installer
$PHPVER installer
$PHPVER -r "unlink('installer');"
sudo cp composer.phar /usr/bin/composer