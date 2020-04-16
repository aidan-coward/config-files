#!/usr/bin/env bash

set -o errexit # exit when a command fails 
set -o pipefail # fail when a pipe fails 
set -o nounset # fail on access of nonexistent variable
# set -o xtrace # print all commands 

######################

URL=$(ls -t /tmp | grep -F '.torrent' | head --lines 1)

scp -r -i /home/aidan/.ssh/id_rsa_alarm /tmp/"$URL" aidan@192.168.2.160:/home/aidan/torrent/rtorrent-session-torrentday/watch/
