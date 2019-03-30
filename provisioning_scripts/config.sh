#!/bin/bash
echo "Configure Users"
USER=`cat /home/vagrant/deployment/.ssh/user`
echo "Configuring Vagrant User"
sudo cp -fr /home/vagrant/deployment/configs/network /etc/sysconfig
sudo cp -fr /home/vagrant/deployment/configs/hosts /etc/
sudo cp -fr /home/vagrant/deployment/.ssh/config /home/vagrant/.ssh/config
sudo cp -fr /home/vagrant/deployment/.ssh/key /home/vagrant/.ssh/key
sed -i -e "s/VAGRANTUSER/vagrant/g" /home/vagrant/.ssh/config
sudo chown -R vagrant:vagrant /home/vagrant
sudo chmod -R 700 /home/vagrant
echo "Building user"
sudo useradd -m -G vagrant $USER
sudo mkdir /home/$USER/.ssh/
sudo mkdir /home/$USER/bin/
sudo cp -fr /home/vagrant/deployment/configs/update.sh bin/
sudo cp -fr /home/vagrant/deployment/.ssh/config /home/$USER/.ssh/config
sudo cp -fr /home/vagrant/deployment/.ssh/key /home/$USER/.ssh/key
sudo cp -fr /home/vagrant/deployment/.ssh/key.pub /home/$USER/.ssh/key.pub
sudo cp -fr /home/vagrant/deployment/.ssh/key.pub /home/$USER/.ssh/authorized_keys
sudo cp -f  /home/vagrant/deployment/configs/sudoers /etc/
sudo sed -i -e "s/VAGRANTUSER/"$USER"/g" /etc/sudoers
sed -i -e "s/VAGRANTUSER/"$USER"/g" /home/$USER/.ssh/config
sudo chown -R $USER:$USER /home/$USER
sudo chmod -R 700 /home/$USER