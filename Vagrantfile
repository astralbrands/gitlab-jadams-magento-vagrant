Vagrant.configure(2) do |config|
    config.vm.box = "bento/centos-7.5"
    config.vbguest.auto_update = true
	config.ssh.forward_agent = true 
		config.vm.provider :virtualbox do |v|
		v.customize ["modifyvm", :id, "--memory", 4096]
		v.customize ["modifyvm", :id, "--cpus", 2]  
		end
    config.vm.network "private_network", ip: "192.168.11.100" 
    config.vm.synced_folder "share", "/home/vagrant/deployment", owner: "vagrant",
    group: "vagrant",
    mount_options: ["dmode=755,fmode=644"]  
	config.vm.provision :shell, path: "provisioning_scripts/env.sh"
	config.vm.provision :shell, path: "provisioning_scripts/config.sh"
	config.vm.provision :shell, path: "provisioning_scripts/mysql.sh"
	config.vm.provision :shell, path: "provisioning_scripts/apache.sh"
	config.vm.provision :shell, path: "provisioning_scripts/setup_composer.sh"
	config.vm.provision :shell, path: "provisioning_scripts/getfiles.sh", privileged: false
	config.vm.provision :shell, path: "provisioning_scripts/buildapp_appdb.sh"
	config.vm.provision :shell, path: "provisioning_scripts/buildapp_appuser.sh"
	config.vm.provision :shell, path: "provisioning_scripts/buildapp_importdb.sh"	
	config.vm.provision :shell, path: "provisioning_scripts/cleanup.sh"		
	config.vm.provision :reload
end