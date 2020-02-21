# Installing BSPWM, SXHKD
sudo apt install bspwm sxhkd
mkdir $HOME/.config/bspwm
mkdir $HOME/.config/sxhkd
ln -sfr bspwmrc ~/.config/bspwm/bspwmrc
ln -sfr sxhkdrc ~/.config/sxhkd/sxhkdrc
chmod +x $HOME/.config/bspwm/bspwmrc
chmod +x $HOME/.config/sxhkd/sxhkdrc

# Installing Rofi, Compton, Fira Code
sudo apt install curl wget feh
sleep 5

## Installing Mousepad config
sudo ln -sfr config/40-libinput.conf /usr/share/X11/xorg.conf.d/40-libinput.conf

## Rofi, dunst and Compton
sudo apt install compton rofi dunst
mkdir ~/.config/dunst
ln -sfr config/dunst ~/.config/dunst/dunstrc && ln -sfr config/compton $HOME/.config/compton.conf

## Fira Code
sudo apt install fonts-firacode

# XRESOURCES
ln -sfr config/XRESOURCES-for-all ~/.Xresources

# Alacritty,tmux, Vim and Doom Emacs
sudo add-apt-repository ppa:mmstick76/alacritty
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt install vim emacs26 alacritty curl tmux
ln -sfr config/alacritty.yml ~/.alacritty.yml
ln -sfr config/tmux.conf ~/.tmux.conf
## Installing plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
##
### Installing Doom Emacs
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
###
rm -rf ~/.doom.d
ln -sfr config/vimrc ~/.vimrc
ln -sfr config/doom.d ~/.doom.d 
~/.emacs.d/bin/doom refresh

# Installing npm and some other programms
sudo apt install node-gyp nodejs-dev libssl1.0-dev npm
sudo apt install ranger python3 python3-pip gcc gdb
## Prettier for Vim
sudo npm install prettier -g

# Installing font-awesome and Zsh
echo "После того, как oh-my-zsh установится на ваш ПК, пожалуйста, выйдите из него нажав Ctrl+D или написав 'exit'"
cd ~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ./config/zshrc ~/.zshrc
sudo npm install @fortawesome/fontawesome-free -g
