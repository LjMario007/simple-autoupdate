#!/usr/bin/env bash
printf "Welcome to a small auto-updater script. This updates the repo lists,
upgrades the packages, updates and upgrades again in case of any changes,
and then deletes the downloaded package cache and removes any unnecessary
packages."
read -r -p " Would you like to continue? [y/n] " response
response=${response,,}
if [[ "$response" =~ ^(yes|y)$ ]]
then
    sudo -v
    sudo apt update
    sudo -v
    sudo apt -y upgrade
    sudo -v
    sudo apt update
    sudo -v
    sudo apt -y upgrade
    sudo -v
    sudo apt -y autoremove
    sudo -v
    sudo apt clean
    sudo -v
    read -r -p "Okay, I've done that; do you want me to also check for a new Ubuntu release(and install it?)(y/n)?" response
    response=${response,,}
    if [[ "$response" =~ ^(yes|y)$ ]]
    then
	sudo -v
	sudo do-release-upgrade
	printf "Done, have a nice day!"
	exit 0
    else
	printf "Done; have a nice day!"
	exit 0
    fi
else
    printf "Aborting script. Have a nice day!
"
    exit 1
fi
