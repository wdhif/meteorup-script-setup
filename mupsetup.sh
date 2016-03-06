#!/bin/bash

echo "This script is made to work on debian-like distributions"

username="Creator4983"
password="KevinFlynn"
sudoers="/etc/sudoers"

if ! [ $(id -u) = 0 ]; then
    echo "Please run as root"
    exit
fi

useradd $username
echo $username:$password | chpasswd
adduser $username sudo
echo "# meteorup-server-script\n%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
service sudo restart

if grep -q "%sudo ALL=(ALL) NOPASSWD:ALL" $sudoers; then
   echo "The script worked correctly, you can now use the new user in your mup.json"
   exit
fi

echo "Check the sudoers file with visudo for %sudo ALL=(ALL) NOPASSWD:ALL"
