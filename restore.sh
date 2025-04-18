#!/usr/bin/env bash

set -e 

echo 

read -p "Do wanna restore your backups? (y/n): " backups

case "$backups" in 

	y) 
		cd ~
		cp -r ~/backup/.config/ ~
		rm -r backup/
		clear
		;;
	n)
		;;
esac
