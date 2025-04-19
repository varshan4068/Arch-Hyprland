#!/usr/bin/env bash

set -e

roll(){
	cat << "EOF"

  _______  ___   __   __  _______  _______  __   __  ___   _______  _______ 
 |       ||   | |  |_|  ||       ||       ||  | |  ||   | |       ||       |
 |_     _||   | |       ||    ___||  _____||  |_|  ||   | |    ___||_     _|
   |   |  |   | |       ||   |___ | |_____ |       ||   | |   |___   |   |  
   |   |  |   | |       ||    ___||_____  ||       ||   | |    ___|  |   |  
   |   |  |   | | ||_|| ||   |___  _____| ||   _   ||   | |   |      |   |  
   |___|  |___| |_|   |_||_______||_______||__| |__||___| |___|      |___|  


EOF
}

clear 
roll

read -p "  Do u wanna backup ur system with timeshift (y/n): " backup

case "$backup" in 
	y)
		timeshift-launcher
		;;
	n)
		exit 0
		;;
esac
