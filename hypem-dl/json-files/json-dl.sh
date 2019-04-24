#!/bin/bash

for i in {0..21}; do
	
	wget --load-cookies=cookie.txt https://hypem.com/playlist/loved/aidonius/json/$i/data.js -O data.js.$i;
	sleep 5;

done
	
