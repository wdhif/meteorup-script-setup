#!/bin/bash

echo "This script is made to work on debian-like distributions"

username="Creator4983"
password="KevinFlynn"

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

useradd $username
echo $password | passwd $username --stdin
adduser $username sudo
sed -i 's/# %sudo  ALL=(ALL) ALL/%sudo ALL=(ALL) NOPASSWD:ALL/'
sed -i 's/%sudo  ALL=(ALL) ALL/%sudo ALL=(ALL) NOPASSWD:ALL/'
service sudo restart

echo "Check the sudoers file with visudo for %sudo ALL=(ALL) NOPASSWD:ALL"
