#!/bin/bash/
apt update -y
apt upgrade -y
apt autoremove -y
apt install software-properties-common
cd ..
mkdir .ssh
read -p "Type in username:" username
ssh-keygen -t ed25519 -C $username -f $(pwd)/.ssh/id_ed25519
eval "$(ssh-agent -s)"
ssh-add $(pwd)/.ssh/id_ed25519
echo Add ssh key to github...
cat $(pwd)/.ssh/id_ed25519.pub
echo Use machine name shown below...
hostname
cd /home/$username/linux-mint-xfce-setup/
bash git.sh
