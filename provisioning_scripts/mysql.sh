#!/bin/bash
echo "Build MySQL"
mkdir mysql
TMPPASS='hd#ftR34Aq13'
DEVPASS='q1w2e3r4'
cd mysql
wget https://www.percona.com/downloads/Percona-Server-5.7/Percona-Server-5.7.22-22/binary/redhat/7/x86_64/Percona-Server-5.7.22-22-rf62d93c-el7-x86_64-bundle.tar
tar xvf Percona-Server-5.7.22-22-rf62d93c-el7-x86_64-bundle.tar
sudo yum -y install openssl openssl-devel perl net-tools perl-Data-Dumper perl-JSON jemalloc git gcc make automake kernel-headers kernel-devel
sudo rpm -Uvh Percona*.rpm
sudo service mysql start
MYSQLROOT=`sudo grep 'A temporary password is generated for root@localhost' /var/log/mysqld.log | awk 'NF>1{print $NF}'`
echo $MYSQLROOT
echo "Set root password"
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$TMPPASS';" | mysql -h localhost -u root -p$MYSQLROOT --connect-expired-password
echo "Remove password validation"
echo "uninstall plugin validate_password;" | mysql -h localhost -u root -p$TMPPASS --connect-expired-password
echo "Set root password"
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'q1w2e3r4';FLUSH PRIVILEGES;" | mysql -h localhost -u root -p$TMPPASS --connect-expired-password
echo "Create User"
echo "CREATE USER 'local'@'localhost' IDENTIFIED BY 'q1w2e3r4';" | mysql -h localhost -u root -p$DEVPASS --connect-expired-password
echo "Grant to new user"
echo "GRANT ALL ON local.* TO 'local'@'localhost';" | mysql -h localhost -u root -p$DEVPASS --connect-expired-password
echo "Flush"
echo "FLUSH PRIVILEGES;" | mysql -h localhost -u root -p$DEVPASS --connect-expired-password