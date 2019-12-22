#!/bin/bash

while :
do
	free -m | head -2 | tail -1 | tr -s ' ' | cut -d' ' -f3
	sleep 1
done
