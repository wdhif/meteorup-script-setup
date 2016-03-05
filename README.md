# meteorup-script-setup
Meteor up server setup made easy

## Installation

1. Change the variable of the script to your liking.
  - `username` is the username of the meteor user, likely to be you appname.
  - `password` is the password for the meteor user, you have to keep the `mkpasswd` command.
2. Launch the script as **root**.
3. Check for `%sudo ALL=(ALL) NOPASSWD:ALL`, if you're not on a debian-like distro, restart the sudo service.

## Troubleshooting

If you get `sudo: no tty present and no askpass program specified` when you do a `mup setup`, check your sudoers file.
