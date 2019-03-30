#!/bin/bash
echo "Cleanup"
sudo service httpd restart
sudo chkconfig mysqld on
sudo chkconfig httpd on