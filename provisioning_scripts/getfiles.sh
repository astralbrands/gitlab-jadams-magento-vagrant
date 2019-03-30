#!/bin/bash
echo "Get files"
USER=`cat  /home/vagrant/deployment/.ssh/user`
ssh-keyscan -H 18.210.135.95 >> ~/.ssh/known_hosts
cd ~
mkdir vhosts
cd vhosts
git clone git:AstralBrands/magento.git local
git clone git:AstralBrands/magento-1-media.git media
git clone git:AstralBrands/magento-1-developers-db.git db
cd db
unzip localdb.zip
sed -i -e "s/\`production\`@\`%/\`local\`@\`localhost/g" localdb.sql
cd ../
cp /home/vagrant/deployment/localdb.zip .
echo "Copying local.xml"
cp /home/vagrant/deployment/configs/local.xml /home/vagrant/vhosts/local/app/etc/
echo "Making log folders"
mkdir -p /home/vagrant/vhosts/local/var/raveinfosys/exporter/
rm -rf /home/vagrant/vhosts/local/var/log
mkdir -p /home/vagrant/vhosts/local/var/log/
touch /home/vagrant/vhosts/local/var/raveinfosys/exporter/order_exception_log.htm
touch /home/vagrant/vhosts/local/var/log/dyi_skipped_products.log
echo "Setting permissions"
find /home/vagrant/vhosts -type d -exec chmod 775 {} \;
find /home/vagrant/vhosts -type f -exec chmod 664 {} \;
echo "Moving files to web folder"
cd /home/vagrant/
sudo mv -f vhosts /var/www/
sudo chown -R $USER:$USER /var/www/*