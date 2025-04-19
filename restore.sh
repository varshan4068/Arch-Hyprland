#!/usr/bin/env bash


restore(){
	cat << "EOF"

			 ______    _______  _______  _______  _______  ______    _______ 
			|    _ |  |       ||       ||       ||       ||    _ |  |       |
			|   | ||  |    ___||  _____||_     _||   _   ||   | ||  |    ___|
			|   |_||_ |   |___ | |_____   |   |  |  | |  ||   |_||_ |   |___ 
			|    __  ||    ___||_____  |  |   |  |  |_|  ||    __  ||    ___|
			|   |  | ||   |___  _____| |  |   |  |       ||   |  | ||   |___ 
			|___|  |_||_______||_______|  |___|  |_______||___|  |_||_______|


EOF
}

clear 
restore

set -e 

echo 

while true;do

read -p " :: Do wanna restore your backups? (y/n): " backups

case "$backups" in 

	[y]*) 
		clear
		echo 
		echo " :: Restoring your Backup files :: "
		cd ~
		cp -r ~/backup/.config/ ~
		rm -r backup/
		clear
		break
		;;
	[n]*)
		clear
		break
		;;
	*)
		echo 
		echo 
		echo " :: Please answer yes or no ::"
		echo 
		echo 
esac

done
