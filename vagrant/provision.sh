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

sudo docker run --rm hello-world
check_errors $?

sudo usermod -aG docker vagrant
check_errors $?

docker-compose version
check_errors $?

sudo usermod -aG docker ${USER}
check_errors $?

# Docker environment config
#echo "export DOCKER_BUILDKIT=1" >> /home/vagrant/.bashrc
echo "export PROMPT_COMMAND=\"history -a; history -r\"" >> /home/vagrant/.bashrc
check_errors $?
