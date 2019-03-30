#!/bin/bash
echo "Build apache"
PHPVER=`cat  /home/vagrant/deployment/configs/phpversion`
USER=`cat  /home/vagrant/deployment/.ssh/user`
sudo yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum -y install zip unzip rar unrar mod_ssl httpd $PHPVER $PHPVER-php $PHPVER-php-bcmath $PHPVER-php-brotli $PHPVER-php-cli $PHPVER-php-common $PHPVER-php-gd $PHPVER-php-imap $PHPVER-php-intl $PHPVER-php-mbstring $PHPVER-php-mcrypt $PHPVER-php-mysqlnd $PHPVER-php-pdo $PHPVER-php-pear $PHPVER-php-pecl-geoip $PHPVER-php-pecl-http $PHPVER-php-pecl-json-post $PHPVER-php-pecl-jsonc $PHPVER-php-pecl-jsond $PHPVER-php-pecl-memcache $PHPVER-php-pecl-redis $PHPVER-php-pecl-varnish $PHPVER-php-pecl-xdebug $PHPVER-php-pecl-zip $PHPVER-php-phalcon $PHPVER-php-soap $PHPVER-php-xml nodejs $PHPVER-php-phar $PHPVER-php-composer
sudo cp /home/vagrant/deployment/configs/selinux /etc/sysconfig/
sudo cp -fr /home/vagrant/deployment/configs/ssl/ /etc/httpd/
sudo mkdir /etc/httpd/vhosts
sudo cp -fr /home/vagrant/deployment/configs/localdb.astralbrands.com.conf /etc/httpd/vhosts/
sudo cp -fr /home/vagrant/deployment/configs/local.cosmedix.com.conf /etc/httpd/vhosts/
sudo cp -fr /home/vagrant/deployment/configs/local.purcosmetics.com.conf /etc/httpd/vhosts/
sudo cp -fr /home/vagrant/deployment/configs/httpd.conf /etc/httpd/conf/
sudo sed -i -e "s/APACHEUSER/"$USER"/g" /etc/httpd/conf/httpd.conf
sudo chown -R $USER:$USER /etc/httpd
sudo chown -R $USER:$USER /opt/remi/$PHPVER
sudo chown -R $USER:$USER /var/opt/remi/$PHPVER
sudo chown -R $USER:$USER /var/log/httpd
sudo chown -R $USER:$USER /var/www
sudo cd /usr/bin
sudo ln -s /usr/bin/$PHPVER php
sudo chmod -R 755 /var/log/httpd