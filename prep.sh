#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
cyan=`tput setaf 5`
reset=`tput sgr0`

echo "${cyan}==================== Preparing Environment =====================${reset}"
sudo cp mycloud /usr/local/bin/
sudo mv mycloud /usr/bin/

sudo apt install -y figlet
sudo apt install -y ansible
echo "${cyan}================== Environment Setup Completed ===================${reset}"
