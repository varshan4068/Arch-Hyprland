#!/usr/bin/env bash

print_logo(){
	cat << "EOF"

  __ __  __ __  ____  ____   _       ____  ____   ___        ___     ___   ______  _____  ____  _        ___  _____
 |  |  ||  |  ||    \|    \ | |     /    ||    \ |   \      |   \   /   \ |      ||     ||    || |      /  _]/ ___/
 |  |  ||  |  ||  o  )  D  )| |    |  o  ||  _  ||    \     |    \ |     ||      ||   __| |  | | |     /  [_(   \_ 
 |  _  ||  ~  ||   _/|    / | |___ |     ||  |  ||  D  |    |  D  ||  O  ||_|  |_||  |_   |  | | |___ |    _]\__  |
 |  |  ||___, ||  |  |    \ |     ||  _  ||  |  ||     |    |     ||     |  |  |  |   _]  |  | |     ||   [_ /  \ |
 |  |  ||     ||  |  |  .  \|     ||  |  ||  |  ||     |    |     ||     |  |  |  |  |    |  | |     ||     |\    |
 |__|__||____/ |__|  |__|\_||_____||__|__||__|__||_____|    |_____| \___/   |__|  |__|   |____||_____||_____| \___|

EOF
}

clear
print_logo

set -e

echo

echo

while true;do

read -p " :: Do u wanna backup your config files before installing my script? (y/n): " backup

case "$backup" in 
	[y]*)
		cd ~
		mkdir backup/
		cp -r ~/.config/ ~/backup/
		break
		;;
	[n]*)
		break
		;;
	 *)
		echo 
		echo
		echo " :: Please answer yes(y) or no(n) ::"
		echo 
		echo
		;;
esac

done

echo

echo

dependencies=(

	git
	neovim
	curl
	wget
	tmux
	base-devel
	gcc
	make
	python
	npm
	go
	fzf
	vscode
	waybar
	rofi-wayland
	ufw
	tldr
	timeshift
	thunar
	thermald 
	swappy
	papirus-icon-theme
	kdeconnect
	nwg-displays
	nwg-look
	hyprpaper
	hyprlock
	grub-btrfs
	bash-completion
	libreoffice-fresh
	brightnessctl
	acpi
	capitaine-cursors
	xorg-xhost
	tree
	qalculate-gtk
	gvfs-mtp
	evolution
	gimp
	kdenlive
	mission-center
	gnome-boxes
	telegram-desktop
	transmission-gtk
	filelight
	impression

)

yay=(

	zen-browser-bin
	dracula-gtk-theme
	hyprshot
	timeshift-autosnap
	battop
)

cd ~

while true;do

read -p " :: Do u wanna install the dependencies? (y/n): " package

case "$package" in

	[y]*)
		echo " :: Installing dependencies ::"

		sudo pacman -S "${dependencies[@]}"

		break
		;;
	[n]*)

		break
		;;

	*)
		echo 
		echo
		echo " :: Please answer yes(y) or no(n) ::"
		echo 
		echo
		;;

esac

done

while true;do

echo 
echo 

read -p " :: Do u wanna install the yay aur helper? (y/n): " aur

case "$aur" in
	[y*])
		echo " :: Installing yay ( AUR helper ) ::"
		git clone https://aur.archlinux.org/yay.git 
		cd yay/
		makepkg -si 
		rm -r ~/yay/
		cd ~
		break
		;;

	[n]*)
		break
		;;

	*)
		echo 
		echo
		echo " :: Please answer yes(y) or no(n) ::"
		;;

esac

done

while true;do

echo 

echo

read -p " :: Do u wanna install some aur packages? (y/n): " depen

case "$depen" in
	[y]*)
		echo " :: Installing aur packages ::"

		yay -S "${yay[@]}"
		break
		;;

	[n]*)
		break
		;;

	 *)
		echo 
		echo
		echo ":: Please answer yes(y) or no(n) ::"
		;;
esac

done

while true;do

echo 

echo

read -p " :: Do u wanna install auto-cpufreq for power saving? (y/n): " cpu 

case "$cpu" in 
	y*)

		git clone https://github.com/AdnanHodzic/auto-cpufreq.git
		cd auto-cpufreq &&  sudo ./auto-cpufreq-installer
		sudo auto-cpufreq --install
		break
		;;
	n*)
		break
		;;
	*)
		echo 
		echo 
		echo ":: Please answer yes(y) or no(n) :: "
		;;
esac

done

while true; do

echo 
echo 

read -p " :: Do you wanna Install ani-cli? (y/n): " ani

case "$ani" in

[y]*)
	echo 
	echo " :: Setting Up ani-cli ::"

	git clone https://github.com/pystardust/ani-cli.git
	cp -r ani-cli/ani-cli /usr/local/bin
	rm -rf ani-cli
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
	echo ":: Please answer yes(y) or no(n) ::"
esac

done

files(){
	cat << "EOF"

				 ___     ___   ______  _____  ____  _        ___  _____
				|   \   /   \ |      ||     ||    || |      /  _]/ ___/
				|    \ |     ||      ||   __| |  | | |     /  [_(   \_ 
				|  D  ||  O  ||_|  |_||  |_   |  | | |___ |    _]\__  |
				|     ||     |  |  |  |   _]  |  | |     ||   [_ /  \ |
				|     ||     |  |  |  |  |    |  | |     ||     |\    |
				|_____| \___/   |__|  |__|   |____||_____||_____| \___|
																															 

EOF
}

files

while true;do

echo

read -p " :: Do u wanna install Dotfiles and some other files? (y/n): " dot

case "$dot" in 
[y]*)
	cd ~/Arch-Hyprland/
	echo
	echo " :: Entered the Arch-Hyprland Directory ::"
	echo
	cp -r starship.toml  nvim/ kitty/ hypr/ dunst/ backgrounds/ rofi/ waybar/  ~/.config/
	cp -r .bashrc  rofi-wifi-menu/ ~
	echo 
	echo " :: Copied the Dotfiles successfully ::"
	echo
	sudo cp rofi-power-menu /usr/bin/
	echo 
	echo " :: Chmoding the Executable files.. ::"
	echo 
	echo 
	cd ~/.config/waybar/scripts/
	chmod +x ani-cli.sh aur.sh disk_script.sh pacman.sh timeshift.sh 
	cd ~
	chmod +x /usr/bin/rofi-power-menu
	chmod +x ~/rofi-wifi-menu/rofi-wifi-menu.sh
	echo " :: Chmoding the Executable files was Successfull"
	echo 
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
	echo " :: Please answer yes(y) or no(n) ::"
	echo
	;;

esac

done

ufw(){
	cat << "EOF"

					     __ __  _____  __    __ 
					    |  |  ||     ||  |__|  |
					    |  |  ||   __||  |  |  |
					    |  |  ||  |_  |  |  |  |
					    |  :  ||   _] |  `  '  |
					    |     ||  |    \      / 
					     \__,_||__|     \_/\_/  
																		
EOF
}

ufw

sudo ufw enable
sudo ufw status
sudo ufw limit 22/tcp  
sudo ufw allow 80/tcp  
sudo ufw allow 443/tcp  
sudo ufw default deny incoming  
sudo ufw default allow outgoing

echo 

echo " :: UFW rules were successfully updated in your system ::"

sleep 1.4

boot(){
	cat << "EOF"

	 _______  ______    __   __  _______    _______  __   __  _______  __   __  _______  _______ 
	|       ||    _ |  |  | |  ||  _    |  |       ||  | |  ||       ||  |_|  ||       ||       |
	|    ___||   | ||  |  | |  || |_|   |  |_     _||  |_|  ||    ___||       ||    ___||  _____|
	|   | __ |   |_||_ |  |_|  ||       |    |   |  |       ||   |___ |       ||   |___ | |_____ 
	|   ||  ||    __  ||       ||  _   |     |   |  |       ||    ___||       ||    ___||_____  |
	|   |_| ||   |  | ||       || |_|   |    |   |  |   _   ||   |___ | ||_|| ||   |___  _____| |
	|_______||___|  |_||_______||_______|    |___|  |__| |__||_______||_|   |_||_______||_______|

EOF
}

clear
boot

while true;do 

echo 

read -p " :: Do u wanna install grub themes by ChrisTitusTech? (y/n): " chris

case "$chris" in
	[y]*)
		echo 
		echo " :: Cloning Themes ::"
		echo
		git clone https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes.git
		cd Top-5-Bootloader-Themes
		sudo ./install.sh ## then select the theme u wanted u install 
		cd ~
		break 
		;;
	[n]*)
		break 
		;;
	*)
	echo 
	echo 
	echo " :: Please answer yes(y) or no(n) ::"
	echo 
	;;
	
	esac
done

sddm(){
	cat << "EOF"

	 _______  ______   ______   __   __    _______  __   __  _______  __   __  _______  _______ 
	|       ||      | |      | |  |_|  |  |       ||  | |  ||       ||  |_|  ||       ||       |
	|  _____||  _    ||  _    ||       |  |_     _||  |_|  ||    ___||       ||    ___||  _____|
	| |_____ | | |   || | |   ||       |    |   |  |       ||   |___ |       ||   |___ | |_____ 
	|_____  || |_|   || |_|   ||       |    |   |  |       ||    ___||       ||    ___||_____  |
	 _____| ||       ||       || ||_|| |    |   |  |   _   ||   |___ | ||_|| ||   |___  _____| |
	|_______||______| |______| |_|   |_|    |___|  |__| |__||_______||_|   |_||_______||_______|

EOF
}

clear
sddm

while true;do

echo

read -p " :: Do u wanna install sddm themes? (y/n): " lm

case "$lm" in
[y]*)
	echo 
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"
	echo 
	echo 
	echo 
	echo " :: Everything is Installed perfectly just reboot your system to get perfect results ::"
	echo 
	echo
	echo
	break 
	;;
[n]*)
	echo 
	echo 
	echo
	echo " :: Everything is Installed perfectly just reboot your system to get perfect results ::"
	echo 
	echo 
	echo 
	break 
	;;

*)
	echo 
	echo 
	echo " :: Please answer yes(y) or no(n) ::"
	echo 
	;;

esac

done


while true;do

read -p " :: Do u wanna delete the directory Arch-Hyprland/ that has been cloned to your system? (y/n): " del 

case "$del" in
 [y]*)
		cd ~
		sudo rm -r Arch-Hyprland/
		echo 
		echo
		echo " :: Deleted the Arch-Hyprland/ directory successfully ::"
		echo 
		echo
		sleep 1.2
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
		echo " :: Please answer yes(y) or no(n) ::"
		echo 
		echo
		;;
	
esac
done

reboot(){
	cat << "EOF"

				 ______    _______  _______  _______  _______  _______ 
				|    _ |  |       ||  _    ||       ||       ||       |
				|   | ||  |    ___|| |_|   ||   _   ||   _   ||_     _|
				|   |_||_ |   |___ |       ||  | |  ||  | |  |  |   |  
				|    __  ||    ___||  _   | |  |_|  ||  |_|  |  |   |  
				|   |  | ||   |___ | |_|   ||       ||       |  |   |  
				|___|  |_||_______||_______||_______||_______|  |___|  

EOF
}

reboot

while true;do

echo
echo

read -p " :: Do u wanna reboot ur system? (y/n): " choose

case "$choose" in
	[y]* )
		echo " :: Rebooting ur system now..... ::"
		systemctl reboot
		sleep 4
		break 
		;;
	[n]* )
		clear
		break 
		;;
	*)
		echo 
		echo 
		echo " :: Please answer yes(y) or no(n) ::"

esac

done


