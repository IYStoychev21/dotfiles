#!bin/bash

echo Enter username: 
read USR

# ---------------------- LINKING PLASMA GLOBAL THEME ----------------------------
DIR=/home/$USR/.local/share/plasma
[ -d "$DIR" ] && rm -R $DIR
ln -s /home/$USR/.dotfiles/plasma/ $DIR

# ---------------------- LINKING ICONS ----------------------------
DIR=/home/$USR/.local/share/icons
[ -d "$DIR" ] && rm -R $DIR
ln -s /home/$USR/.dotfiles/icons/ $DIR

# ---------------------- LINKING COLOR SCHEMES ----------------------------
DIR=/home/$USR/.local/share/color-schemes
[ -d "$DIR" ] && rm -R $DIR
ln -s /home/$USR/.dotfiles/color-schemes/ $DIR

# ---------------------- SPICETIFY ----------------------------
DIR=/home/$USR/.spicetify
[ -d "$DIR" ] && rm -R $DIR
ln -s /home/$USR/.dotfiles/.spicetify/ $DIR

# ---------------------- WALLPAPERS ----------------------------
DIR=/home/$USR/wallpapers
[ -d "$DIR" ] && rm -R $DIR
ln -s /home/$USR/.dotfiles/wallpapers/ $DIR

# ---------------------- ALACRITTY ----------------------------
DIR=/home/$USR/.config/alacritty
[ -d "$DIR" ] && rm -R $DIR
ln -s /home/$USR/.dotfiles/alacritty/ $DIR

# ---------------------- AUTOSTART ----------------------------
DIR=/home/$USR/.config/autostart
[ -d "$DIR" ] && rm -R $DIR
ln -s /home/$USR/.dotfiles/autostart/ $DIR

# ---------------------- FISH ----------------------------
DIR=/home/$USR/.config/fish
[ -d "$DIR" ] && rm -R $DIR
ln -s /home/$USR/.dotfiles/fish/ $DIR

# ---------------------- LATTE ----------------------------
DIR=/home/$USR/.config/latte
[ -d "$DIR" ] && rm -R $DIR
ln -s /home/$USR/.dotfiles/latte/ $DIR

