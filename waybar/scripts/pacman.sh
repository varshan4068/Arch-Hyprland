pacman(){
	cat << "EOF"


				██████╗  █████╗  ██████╗███╗   ███╗ █████╗ ███╗   ██╗   
				██╔══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║   
				██████╔╝███████║██║     ██╔████╔██║███████║██╔██╗ ██║   
				██╔═══╝ ██╔══██║██║     ██║╚██╔╝██║██╔══██║██║╚██╗██║   
				██║     ██║  ██║╚██████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║   
				╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝   
																																																													 

EOF
}

clear
pacman

read -p "  Do u wanna update ur pacman (y/n): " pacman 

case "$pacman" in
	y)
		echo 
		sudo pacman -Syu
		sleep 1
		;;
	n)
		;;
esac

echo 

echo


read -p "  Do u wanna delete the /var/cache/pacman (y/n): " delete

case "$delete" in 
	y)
		cd /var/cache/
		sudo rm -r pacman/
		sleep 1
		;;
	n)
		exit 0
		;;
esac



