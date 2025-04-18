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

read -p "Do u wanna backup your config files before installing my script? (y/n): " backup

case "$backup" in 
	y)
		cd ~
		mkdir backup/
		cp -r ~/.config/ ~/backup/
		;;
	n)
		;;
esac

echo

echo

echo "                                        Installation has been started "

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

echo

read -p "Do u wanna install the dependencies? (y/n): " package

case "$package" in

	y)
		echo "Installing dependencies"

		sudo pacman -S "${dependencies[@]}"
		;;
	n)
		;;
esac

echo

read -p "Do u wanna install the yay aur helper? (y/n): " aur
	
case "$aur" in
	y)
		echo "Installing yay ( AUR helper )"
		

		git clone https://aur.archlinux.org/yay.git 
		cd yay/
		makepkg -si 
		rm -r ~/yay/
		cd ~
		;;
	n)
		;;
esac

echo 


read -p "Do u wanna install some aur packages? (y/n): " depen

case "$depen" in
	y)
		echo "Installing aur packages"

		yay -S "${yay[@]}"

		clear
		;;
	n)
		clear
esac

cpu(){
	cat << "EOF"

  ____  __ __  ______   ___          __  ____  __ __  _____  ____     ___   ___  
 /    ||  |  ||      | /   \        /  ]|    \|  |  ||     ||    \   /  _] /   \     Power Saving Tool
|  o  ||  |  ||      ||     |      /  / |  o  )  |  ||   __||  D  ) /  [_ |     |	  
|     ||  |  ||_|  |_||  O  |     /  /  |   _/|  |  ||  |_  |    / |    _]|  Q  |		
|  _  ||  :  |  |  |  |     |    /   \_ |  |  |  :  ||   _] |    \ |   [_ |     |	   
|  |  ||     |  |  |  |     |    \     ||  |  |     ||  |   |  .  \|     ||     |
|__|__| \__,_|  |__|   \___/      \____||__|   \__,_||__|   |__|\_||_____| \__,_|    Just try it!
																																					 

EOF
}

cpu

read -p "Do u wanna install auto-cpufreq for power saving? (y/n): " cpu 

case "$cpu" in 
	y)

		git clone https://github.com/AdnanHodzic/auto-cpufreq.git
		cd auto-cpufreq &&  sudo ./auto-cpufreq-installer
		sudo auto-cpufreq --install
		clear
		;;
	n)
		clear 
		;;
esac

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

read -p "Do u wanna install Dotfiles and some other files? (y/n): " dot

case "$dot" in 
y)
	cd ~/Arch-Hyprland/
	echo "--> Entered the Arch-Hyprland Directory"
	echo
	cp -r starship.toml  nvim/ kitty/ hypr/ dunst/ backgrounds/ rofi/ waybar/  ~/.config/
	cp -r .bashrc  rofi-wifi-menu/ ~
	echo 
	echo "--> Copied the Dotfiles successfully"
	echo
	sudo cp -r rofi-power-menu /usr/bin/
	cd ~
	clear
	;;
n)
	clear
esac

anime(){
	cat << EOF

					 █████╗ ███╗   ██╗██╗       ██████╗██╗     ██╗
					██╔══██╗████╗  ██║██║      ██╔════╝██║     ██║
					███████║██╔██╗ ██║██║█████╗██║     ██║     ██║
					██╔══██║██║╚██╗██║██║╚════╝██║     ██║     ██║
					██║  ██║██║ ╚████║██║      ╚██████╗███████╗██║
					╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝       ╚═════╝╚══════╝╚═╝


EOF
}

anime

read -p "Do you wanna Install ani-cli? (y/n): " ani

case "$ani" in

y )
	echo "Setting Up ani-cli"

	git clone "https://github.com/pystardust/ani-cli.git"
	cp -r ani-cli/ani-cli /usr/local/bin
	rm -rf ani-cli
	clear
	;;
n )
	clear
	;;
esac


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

echo "UFW rules were successfully updated in your system"

sleep 1.4

boot(){
	cat << "EOF"
																		

		 ██████╗ ██████╗ ██╗   ██╗██████╗     ████████╗██╗  ██╗███████╗███╗   ███╗███████╗
		██╔════╝ ██╔══██╗██║   ██║██╔══██╗    ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝
		██║  ███╗██████╔╝██║   ██║██████╔╝       ██║   ███████║█████╗  ██╔████╔██║█████╗  
		██║   ██║██╔══██╗██║   ██║██╔══██╗       ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  
		╚██████╔╝██║  ██║╚██████╔╝██████╔╝       ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗
		 ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═════╝        ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
																																											

EOF
}

clear
boot
read -p "Do u wanna install grub themes by ChrisTitusTech? (y/n): " chris

case "$chris" in
	y)
		git clone https://github.com/ChrisTitusTech/Top-5-Bootloader-Themes.git
		cd Top-5-Bootloader-Themes
		sudo ./install.sh ## then select the theme u wanted u install 
		cd ~
		;;
	n)
		;;
	esac

sddm(){
	cat << "EOF"

	███████╗██████╗ ██████╗ ███╗   ███╗    ████████╗██╗  ██╗███████╗███╗   ███╗███████╗███████╗
	██╔════╝██╔══██╗██╔══██╗████╗ ████║    ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝██╔════╝
	███████╗██║  ██║██║  ██║██╔████╔██║       ██║   ███████║█████╗  ██╔████╔██║█████╗  ███████╗
	╚════██║██║  ██║██║  ██║██║╚██╔╝██║       ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  ╚════██║
	███████║██████╔╝██████╔╝██║ ╚═╝ ██║       ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗███████║
	╚══════╝╚═════╝ ╚═════╝ ╚═╝     ╚═╝       ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝╚══════╝


EOF
}

clear
sddm

read -p "Do u wanna install sddm themes? (y/n): " lm

case "$lm" in
y)
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"
  ;;
n)
	echo
	echo
	echo "Everything is Installed perfectly just reboot your system to get perfect results"
	echo 
	echo
	;;
esac

read -p "Do u wanna delete the directory Arch-Hyprland/ that has been cloned to your system? (y/n): " del 

case "$del" in
	y)
		cd ~
		sudo rm -r Arch-Hyprland/
		echo 
		echo
		echo "Deleted the Arch-Hyprland/ directory successfully"
		sleep 1.2
		echo 
		clear
		;;
	n)
		clear
		;;
esac



reboot(){
	cat << "EOF"

				██████╗ ███████╗██████╗  ██████╗  ██████╗ ████████╗
				██╔══██╗██╔════╝██╔══██╗██╔═══██╗██╔═══██╗╚══██╔══╝
				██████╔╝█████╗  ██████╔╝██║   ██║██║   ██║   ██║   
				██╔══██╗██╔══╝  ██╔══██╗██║   ██║██║   ██║   ██║   
				██║  ██║███████╗██████╔╝╚██████╔╝╚██████╔╝   ██║   
				╚═╝  ╚═╝╚══════╝╚═════╝  ╚═════╝  ╚═════╝    ╚═╝   
																													 
EOF
}

reboot

read -p "Do u wanna reboot ur system? (y/n): " choose

case "$choose" in
	y )
		echo "Rebooting ur system now....."
		systemctl reboot
		sleep 4
		;;
	n )
		clear
		;;
esac

shutdown(){
	cat << "EOF"

			 ███████╗██╗  ██╗██╗   ██╗████████╗██████╗  ██████╗ ██╗    ██╗███╗   ██╗
			 ██╔════╝██║  ██║██║   ██║╚══██╔══╝██╔══██╗██╔═══██╗██║    ██║████╗  ██║
			 ███████╗███████║██║   ██║   ██║   ██║  ██║██║   ██║██║ █╗ ██║██╔██╗ ██║
			 ╚════██║██╔══██║██║   ██║   ██║   ██║  ██║██║   ██║██║███╗██║██║╚██╗██║
			 ███████║██║  ██║╚██████╔╝   ██║   ██████╔╝╚██████╔╝╚███╔███╔╝██║ ╚████║
			 ╚══════╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═══╝
																																				
EOF
}

shutdown

read -p "Do u wanna Shutdown ur system? (y/n): " select

case "$select" in 
	y )
		echo "Shutdowing ur system now....."
		systemctl poweroff 
		sleep 3
		;;
	n )
		clear
		exit 0
		;;
esac



