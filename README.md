# 1.
# connect to wifi using nmcli
# nmcli device wifi connect SSID password {password}

# 2.
# Install yay
# cd $HOME
# git clone https://aur.archlinux.org/yay-git
# cd yay-git
# makepkg -si
# cd $HOME
# rm -rf yay-git

# 3. clone existing dotfiles from master
# cd $HOME
# git clone https://github.com/LukasJenicek/dotfiles

# 4. Initialize stow
# cd $HOME
# yay -S stow
# stow .

# 5. Install dependencies
# yay -S alacritty dunst firefox flameshot neofetch openssh pavucontrol ttf-hack-nerd telegram spotify waybar wlogout wofi wl-clipboard zsh

# 6. Install zsh powerline fonts
# git clone https://github.com/powerline/fonts.git --depth=1
# cd fonts
# ./install.sh
# cd ..
# rm -rf fonts

