#!/bin/bash

echo "This script is made to work on debian-like distributions"

username="Creator4983"
password="KevinFlynn"

if ! [ $(id -u) = 0 ]; then
    echo "Please run as root"
    exit
fi

useradd $username
echo $username:$password | chpasswd
adduser $username sudo
echo "# meteorup-server-script\n%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
service sudo restart

echo "Check the sudoers file with visudo for %sudo ALL=(ALL) NOPASSWD:ALL"
