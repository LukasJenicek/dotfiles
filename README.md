# Dotfiles

## Ubuntu install
1. Install packages `sudo apt install alacritty cargo direnv git fzf curl libssl-dev make pkg-config stow zsh zellij`
2. Clone dotfiles repository `cd $HOME && git clone https://github.com/LukasJenicek/dotfiles`
3. Install plugins
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
git clone https://github.com/fdellwing/zsh-bat.git $ZSH_CUSTOM/plugins/zsh-bat
```
4. Install zellij `cargo install --locked zellij`
5. cd `$HOME/dotfiles` && stow .
6. `mv $HOME/.oh-my-zsh $HOME/.config/zsh/ohmyzsh`
7. Install alacritty `sudo add-apt-repository ppa:aslatter/ppa -y && sudo apt install alacritty`

## Arch install

## 1. Install yay

```bash
cd $HOME
git clone <https://aur.archlinux.org/yay-git>
cd yay-git
makepkg -si
cd ../
rm -rf yay-git
```

## 2. Clone project

```bash
cd $HOME 
git clone https://github.com/LukasJenicek/dotfiles
cd dotfiles/.config/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
git clone https://github.com/fdellwing/zsh-bat.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bat
cd $HOME
```

## 3. Initialize stow

```bash
yay -S stow
stow
```

## 4. Install dependencies

```bash
yay -S \ 
    alacritty asdf-vm \
    bat blueman bluez bluez-utils \
    direnv docker docker-compose dunst \
    exa \
    grim \ 
    firefox flameshot-git fzf \
    hyprland \ 
    jless \
    ttf-hack-nerd telegram-desktop \
    ripgrep \
    spotify solaar slack-desktop \
    waybar wlogout wofi wl-clipboard \
    zellij zsh
```

## 5. Install zsh powerline fonts

```bash
git clone <https://github.com/powerline/fonts.git> --depth=1
./fonts/install.sh
rm -rf fonts
# install tools defined in $HOME/.tool-versions
asdf plugin add golang
asdf plugin add nodejs
asdf plugin add lazydocker <https://github.com/comdotlinux/asdf-lazydocker.git>
asdf install
```

## 6. Solaar

- See: <https://pwr-solaar.github.io/Solaar/rules>
