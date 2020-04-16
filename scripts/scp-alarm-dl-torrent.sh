#!/usr/bin/env bash

set -o errexit # exit when a command fails 
set -o pipefail # fail when a pipe fails 
set -o nounset # fail on access of nonexistent variable
# set -o xtrace # print all commands 

######################
# args are $name of file and $location

echo "$1" 
echo "$2"
scp -r -i /home/aidan/.ssh/id_rsa_alarm aidan@192.168.2.160:/home/aidan/torrent/rtorrent-session/"$1" "$2"

