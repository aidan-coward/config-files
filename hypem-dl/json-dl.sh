#!/usr/bin/env bash

set -o errexit # exit when a command fails 
set -o pipefail # fail when a pipe fails 
set -o nounset # fail on access of nonexistent variable
# set -o xtrace # print all commands 

######################

cd /home/aidan/.config/hypem-dl/files/

# removing existing files
echo "removing existing files"
rm -f ./*

# initialize counter
counter="1"

# download files
while wget --load-cookies=/tmp/cookies.txt https://hypem.com/playlist/loved/aidonius/json/"$counter"/data.js
do
	sleep 2
	((counter++))
done
