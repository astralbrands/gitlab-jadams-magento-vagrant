
Install or update Vagrant

https://www.vagrantup.com/downloads.html

Install or update Virtualbox

https://download.virtualbox.org/virtualbox/

On the command line in your working folder add the following Vagrant plugins if you have not already.
	vagrant plugin install vagrant-vbguest
	vagrant plugin install vagrant-share
	vagrant plugin install vagrant-reload
	
	
Clone the current Vagrant release to your working folder.

https://git.astralbrands.com/AstralBrands/MagentoVagrant	
	
Add your SSH key into your vagrant instance for the project that you use for git.

Open a console window and change directories to your cloned vagrant instance.

Copy your private key file to share/.ssh/key renaming it to key
Copy your public key file to share/.ssh/key.pub renaming it to key.pub

Edit the file share/.ssh/user
Replace USERNAME with your git username 	

Add the following entry into your hosts file.

	For windows located in C:\Windows\System32\drivers\etc
	
	192.168.11.100	local.purcosmetics.com
	192.168.11.100 	local.cosmedix.com
	192.168.11.100 	localdb.astralbrands.com
	
	For Mac's
	vi /etc/hosts
	
	Add the entries above.


Open up a command prompt.

Type 

vagrant up

This will build the Astral Brands developers release.

Magento admin credentials

https://local.DOMAIN.com/index.php/admin/

User development 
Password q1w2e3r4

MySQL credentials

User root 
Password q1w2e3r4

User localdev
Password q1w2e3r4


On windows systems add this in git bash before commits 
git config --global core.autocrlf input