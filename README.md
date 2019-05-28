## VM Installation (Windows only)

**Setting up local vagrant environment (Windows only)**

Step 1: Install Virtualbox (https://www.virtualbox.org/)

Step 2: Install vagrant (https://www.vagrantup.com/)

Step 3: Install vagant plugins
`````
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostmanager
`````
 
Step 4: Launch Vagrant Box
`````
cd vagrant
vagrant box update
vagrant up 
vagrant ssh
`````

