#!/usr/bin/env bash

set -o errexit # exit when a command fails 
set -o pipefail # fail when a pipe fails 
set -o nounset # fail on access of nonexistent variable
# set -o xtrace # print all commands 

######################
cd /home/aidan/.config/hypem-dl/files/

# initialize counters
max_counter=$(wc -l < artists.txt)
counter="1"

# download file and add artist/title metadata if the file is not on the list
while [ "$counter" -le "$max_counter" ]
do
	# variables
	artist=$(sed "${counter}q;d" artists.txt)
	title=$(sed "${counter}q;d" titles.txt)
	date=$(sed "${counter}q;d" date_loved_converted.txt)

	filename="$title - $artist"
	total_filename="$title - $artist - $date"

	# check if it has been downloaded, if so cancel download
	if grep -Fxq "$filename" ../already-downloaded.txt
	then
		echo "$filename has already been downloaded" 
		((counter++))
		continue	
	else
	youtube-dl --config-location /home/aidan/.config/hypem-dl/youtube-dl.conf --output /home/aidan/music/hypem/pre-convert/"$total_filename"."%(ext)s" "ytsearch1: $title $artist" 
	ffmpeg -i /home/aidan/music/hypem/pre-convert/"$total_filename".opus -metadata title="$title" -metadata artist="$artist" /home/aidan/music/hypem/"$total_filename".opus && echo "$filename" >> ../already-downloaded.txt

	fi

	((counter++))
done

rm /home/aidan/music/hypem/pre-convert/*
