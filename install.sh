#!/bin/bash
# moves important config files to /home/aidan/config and sets up symbolic links that point to them

# pacman config file
rm /etc/pacman.conf 
ln -s /home/aidan/.config/pacman/pacman.conf /etc/pacman.conf

# pacman mirrorlist
rm /etc/pacman.d/mirrorlist 
ln -s /home/aidan/.config/pacman/mirrorlist /etc/pacman.d/mirrorlist

# X11 keyboard file
rm /usr/share/X11/xkb/symbols/us
ln -s /home/aidan/.config/keyboard/us /usr/share/X11/xkb/symbols/us

#xorg keyboard conf file
ln -s /home/aidan/.config/keyboard/10-keyboard.conf /etc/X11/xorg.conf.d

#chromebook touchpad file
ln -s /home/aidan/.config/X/50-cros-touchpad.conf /etc/X11/xorg.conf.d/
#other xorg config files
ln -s /home/aidan/.config/X/.Xauthority /home/aidan/.Xauthority
ln -s /home/aidan/.config/X/.Xresources /home/aidan/.Xresources
ln -s /home/aidan/.config/X/.xbindkeysrc /home/aidan/.xbindkeysrc
ln -s /home/aidan/.config/X/.xinitrc /home/aidan/.xinitrc

#bashrc
rm /home/aidan/.bashrc
ln -s /home/aidan/.config/bashrc /home/aidan/.bashrc

#cmus 
ln -s /home/aidan/.config/cmus /home/aidan/.cmus

#vim 
ln -s /home/aidan/.config/vim /home/aidan/.vim

#xmonad 
ln -s /home/aidan/.config/xmonad /home/aidan/.xmonad

# top config file
mv .toprc .config/toprc; ln -s /home/aidan/.config/toprc /home/aidan/.toprc

# 
