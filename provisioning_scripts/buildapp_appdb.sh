#!/bin/bash
echo "Build application step 1 Move appplication database file to MySQL folder /var/lib/mysql"
sudo mv -f /var/www/vhosts/db/localdb.sql /var/lib/mysql/
sudo chown -R mysql:mysql /var/lib/mysql/localdb.sql