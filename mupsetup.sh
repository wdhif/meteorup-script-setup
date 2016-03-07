#!/bin/bash

ask() {
    while true; do
        read -p "$1 [Y/n] " REPLY </dev/tty
        if [ -z "$REPLY" ]; then
            REPLY=Y
        fi
        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac
    done
}

if ! [ $(id -u) = 0 ]; then
    echo "Please run as root"
    exit
fi

echo "This script is made to work on debian-like distributions"

username="Creator4983"
password="KevinFlynn"

echo "What is the username of the meteor user, likely to be you appname?"
read username
echo "What is the password of the meteor user?"
read password
if ask "Is /etc/sudoers your sudoers file?"; then
    sudoers="/etc/sudoers"
else
    echo "Where is located your sudoers file?"
    read sudoers
fi

useradd $username
echo $username:$password | chpasswd
adduser $username sudo
if grep -q "%sudo ALL=(ALL) NOPASSWD:ALL" $sudoers; then
   echo "The script worked correctly, you can now use the new user in your mup.json"
   exit
fi
echo "# meteorup-server-script\n%sudo ALL=(ALL) NOPASSWD:ALL" >> $sudoers
service sudo restart

if grep -q "%sudo ALL=(ALL) NOPASSWD:ALL" $sudoers; then
   echo "The script worked correctly, you can now use the new user in your mup.json"
   exit
fi

echo "The script could not modify the sudoers file check with visudo for %sudo ALL=(ALL) NOPASSWD:ALL"
