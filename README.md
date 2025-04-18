
![GitHub last commit](https://img.shields.io/github/last-commit/varshan4068/Arch-Hyprland?style=for-the-badge&color=3699bc) 
![GitHub size](https://img.shields.io/github/repo-size/varshan4068/Arch-Hyprland?style=for-the-badge&color=f38ba8)

# Arch-Hyprland  
                                                                                                                                                                 
  clone my repository using : 

    git clone https://github.com/varshan4068/Arch-Hyprland.git

  Just run the install.sh in your hyprland window manager using

    cd Arch-Hyprland/
    chmod +x install.sh
    ./install.sh 

 > [!WARNING]
 > This dotfiles were only tested on arch linux so try it with other distros on your own risk....
 >
 > It's recommended to snapshot your system with timeshift before running my installation script so that you can backup your system in case of any errors or may be you don't like my dotfiles....
 >
 > Or you can backup your config files when running my installation script by answering yes to the prompt which whould ask to backup your files before procceding to the next step of the installation of my hyprland dotfiles ...

  It's recommended to go through the install.sh script once because in the script i have included the script for installing my needed dependencies,so you can alter the script accordingly for your needs of installing your needed dependencies...

 
  After everything is setup using nwg-look select the dracula-gtk theme 

  > Bash is configured with starship prompt

  
  You can customise the colorscheme of kitty by typing the following command on your kitty terminal

     theme
  
  And i included auto-cpufreq tool a very good tool for your system which does save battery life a lot more better than tlp does and if u wanna know more details then refer the repo
  
    https://github.com/AdnanHodzic/auto-cpufreq.git 

  
  Some basic Keybindings in my hyprland configuration were,
   | Keys          |      Applications         |
   | ------------- | ------------------------- |
   | Super + a     |  Rofi                     |
   | Super + e     |  Thunar file manager      |
   | Super + d     |  Gnome-disk-utility       | 
   | Super + return|  kitty                    | 
   | Super + p     |  Retoggling the waybar    |
   | Super + w     |  Rofi-wifi-menu           |
   | Super + v     |  vscode                   |
   | Super + c     |  Used for Closing Apps    |
   | print screen  |  screenshot with hyprshot |


  To Know About All keybindings just refer the hyprland.conf at ~/.config/hypr 
  
  
  This repo also includes a very basic and useful plugins for neovim like neo-tree treesitter nvim-cmp , etc.... with catppuccin color scheme

  
  The sddm themes were taken from the repo  
      
    https://github.com/Keyitdev/sddm-astronaut-theme.git

  
  That's it these were my personally used hyprland configuration , feel free to try out my dotfiles if any issues or bugs in my dotfiles report it and i would solve   the issues quickly... 

  
  These repo will be updated when changes were made in my personal configurations and in case of any bugs in my code......
