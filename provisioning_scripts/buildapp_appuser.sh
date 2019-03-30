#!/bin/bash
echo "Build application step 2 Import application user"
DEVPASS='q1w2e3r4'
sudo cp /home/vagrant/deployment/configs/user.sql /var/lib/mysql/
sudo chown -R mysql:mysql /var/lib/mysql/user.sql
mysql -h localhost -u root -p$DEVPASS mysql < /var/lib/mysql/user.sql
mysql -h localhost -u root -p$DEVPASS -e "GRANT ALL PRIVILEGES ON localdev.* TO 'localdev'@'localhost';"
mysql -h localhost -u root -p$DEVPASS -e "GRANT ALL PRIVILEGES ON localdev.* TO 'local'@'localhost';"