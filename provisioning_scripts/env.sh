#!/bin/bash
echo "Provisioning Centos7 for Magento LAMP stack"
echo "Updating system"
sudo yum -y update
echo "Installing Yum Utils"
yum install yum-utils
echo "Installing EPEL"
sudo yum -y install epel-release
echo "Installing wget"
sudo yum -y install wget