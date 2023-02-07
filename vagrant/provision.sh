#!/usr/bin/env bash

#helper function
log_message()
{
    LOGPREFIX="[$(date '+%Y-%m-%d %H:%M:%S')][$(basename $0)]"
    MESSAGE=$1
    echo "$LOGPREFIX $MESSAGE"
}

#check for errors
check_errors()
{
    EXITCODE=$1
    if [[ ${EXITCODE} -ne 0 ]]; then
        log_message "ERROR: there were some errors, check the output for details."
        exit 1
#    else
#        log_message "OK, operation successfully completed."
    fi
}

# update DNS
#echo "nameserver 1.1.1.1" > /etc/resolv.conf
#echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# update system libs
sudo apt-get -y update
check_errors $?
sudo apt-get -y upgrade
check_errors $?

# Timezone config
ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
check_errors $?

# install common system libs
sudo apt-get install -y mc joe git multitail screen nmap htop iotop jnettop elinks pydf zip docker-compose
check_errors $?

#curl https://get.docker.com/ | sh
#check_errors $?

sudo docker run hello-world
check_errors $?

sudo usermod -aG docker vagrant
check_errors $?

##Update docker-compose to the newest version, see https://github.com/docker/for-linux/issues/563
#sudo apt-get -y remove docker-compose golang-docker-credential-helpers
#check_errors $?
##VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*\d')
#VERSION="1.28.6"
#DESTINATION=/usr/local/bin/docker-compose
#sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o $DESTINATION
#check_errors $?
#sudo chmod 755 $DESTINATION
#check_errors $?

#sudo pip install docker-compose
#check_errors $?

docker-compose version
check_errors $?

sudo usermod -aG docker ${USER}
check_errors $?

#sudo mkdir /tmp/composer-cache
#check_errors $?
#sudo chmod -R a+rwxX /tmp/composer-cache
#check_errors $?

# Docker environment config
#echo "export DOCKER_ENV=local" >> /home/vagrant/.bashrc
echo "export DOCKER_BUILDKIT=1" >> /home/vagrant/.bashrc
echo "export PROMPT_COMMAND=\"history -a; history -r\"" >> /home/vagrant/.bashrc
check_errors $?
