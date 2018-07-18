#!/bin/bash

#sudo pacman -Syy

mapfile -t packages_to_update < <( pacman -Qqu )

echo $'packages_to_update'

#while read -r line; do
#	echo "$line"
#done <<< $packages_to_update

#for x in $packages_to_update; do
#	echo $x
#done
