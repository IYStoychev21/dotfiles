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
