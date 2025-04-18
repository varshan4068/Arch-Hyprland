#!/usr/bin/env bash

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
