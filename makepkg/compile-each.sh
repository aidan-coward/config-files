#!/bin/bash
echo 'checking for compiled package updates'

# update package databases with "pacman -Syy"
#
# assign output of "pacman -Quq" to a variable - $TO_UPDATE 
# this is the packages that need to be updated, with the output set to quiet for just package name
# if any element of "asp list-local" is part of $TO_UPDATE, move to /home/aidan/abs/$element/trunk
	# update with "asp something"
	# open vim to edit pkgbuild if needed
	# build package
# install packages


# make script that does all of the updating and alias to said script in .bashrc?
# write compilation script in rust? 
# test if sudo works

sudo pacman -Syy



 then
 	# asp update
 	cd /home/aidan/abs
 	for D in */
 	do
 		echo "current dir is '$D'" 	# for debug
 		cd /home/aidan/abs/"$D"
 		pwd 				# for debug
 		git fetch --all 		# update each package directory
 		git reset --hard		# reset changed files to the `git fetch`
 		cd trunk
 		echo "groups=('modified')" >> PKGBUILD 	# add package to group so that pacman doesn't update it 
 		if [ "$D" = "lib32-mesa/" ] || [ "$D" = "mesa/" ]
 		then
 		vim  PKGBUILD
 		fi
 	
 		makepkg -s --skippgpcheck
 		makepkg --clean
 	done
 
 cd /home/aidan/abs
 
 sudo pacman --needed -U ./*.pkg.tar
 
 else 
 	echo 'not a day for compiling'
 
 fi


	


asp update
