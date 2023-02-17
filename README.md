## VM Installation

Step 1: Install Virtualbox (https://www.virtualbox.org/)

Step 2: Install vagrant (https://www.vagrantup.com/)

Step 3: Install vagant plugins (optional)
```shell
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-hostmanager
`````
 
Step 4: Launch Vagrant Box and log into VM
```shell
cd vagrant
vagrant up 
vagrant ssh
`````

Step 5: Once you're inside the VM
```shell
docker run --rm hello-world
cd /dockertutorial 
ls
```