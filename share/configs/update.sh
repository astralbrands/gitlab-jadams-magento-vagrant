#!/bin/bash
echo "Update Server";
cd /var/www/vhosts/local;
BRANCH=$1
git pull origin $BRANCH;
php shell/cleancache.php;