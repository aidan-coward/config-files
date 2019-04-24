#!/bin/bash

screen -d -m -S rtorrent-torrentday rtorrent -n -o import=/home/aidan/torrent/rtorrent-torrentday.rc

screen -d -m -S rtorrent rtorrent -n -o import=/home/aidan/torrent/rtorrent.rc
