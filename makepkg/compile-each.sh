ifDate=`date '+%d'`
if [ $(($ifDate % 8)) == 0 ]
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
	done

cd /home/aidan/abs

sudo pacman -U ./*.pkg.tar

fi


		


#asp update
