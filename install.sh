#!/bin/bash
# moves important config files to /home/aidan/config and sets up symbolic links that point to them

# install all old packages
pacman -S - < /home/aidan/.config/current-packages.txt
# pacman config file
rm /etc/pacman.conf 
ln -s /home/aidan/.config/pacman/pacman.conf /etc/pacman.conf

# pacman mirrorlist
rm /etc/pacman.d/mirrorlist 
ln -s /home/aidan/.config/pacman/mirrorlist /etc/pacman.d/mirrorlist

# X11 keyboard file
rm /usr/share/X11/xkb/symbols/us
if [ $HOSTNAME == jade-sky ]
then
ln -s /home/aidan/.config/keyboard/us /usr/share/X11/xkb/symbols/us-dell
fi

if [ $HOSTNAME == sky-xul ]
then
ln -s /home/aidan/.config/keyboard/us /usr/share/X11/xkb/symbols/us-chromebook
fi


#xorg keyboard conf file
if [ $HOSTNAME == jade-sky ]
then
	ln -s /home/aidan/.config/keyboard/10-keyboard.conf /etc/X11/xorg.conf.d/
fi

if [ $HOSTNAME == sky-xul ]
then
	ln -s /home/aidan/.config/keyboard/10-keyboard.conf-multi-chromebook /etc/X11/xorg.conf.d/10-keyboard.conf
fi

#chromebook touchpad file
ln -s /home/aidan/.config/X/50-cros-touchpad.conf /etc/X11/xorg.conf.d/
#other xorg config files
ln -s /home/aidan/.config/X/.Xauthority /home/aidan/.Xauthority
ln -s /home/aidan/.config/X/.Xresources /home/aidan/.Xresources

if [ $HOSTNAME == jade-sky ]
then
ln -s /home/aidan/.config/X/.xbindkeysrc /home/aidan/.xbindkeysrc-dell
fi

if [ $HOSTNAME == sky-xul ]
then
ln -s /home/aidan/.config/X/.xbindkeysrc /home/aidan/.xbindkeysrc-chromebook
fi

ln -s /home/aidan/.config/X/.xinitrc /home/aidan/.xinitrc

#bashrc
rm /home/aidan/.bashrc
ln -s /home/aidan/.config/bashrc /home/aidan/.bashrc

#cmus 
ln -s /home/aidan/.config/cmus /home/aidan/.cmus

#vim 
ln -s /home/aidan/.config/vim /home/aidan/.vim

#xmonad 
if [ $HOSTNAME == jade-sky ]
then
	ln -s /home/aidan/.config/xmonad/dell /home/aidan/.xmonad
fi

if [ $HOSTNAME == sky-xul ] 
then
	ln -s /home/aidan/.config/xmonad/chromebook /home/aidan/.xmonad
fi



# top config file
mv .toprc .config/toprc; ln -s /home/aidan/.config/toprc /home/aidan/.toprc

#get graphics drivers 
if [ $HOSTNAME == jade-sky ]
then
	sudo pacman -S xf86-video-intel xf86-video-ati
fi
if [$HOSTNAME == sky-xul ]
	sudo pacman -S xf86-video intel
fi

# set rust stuff
rustup install stable
rustup default stable
