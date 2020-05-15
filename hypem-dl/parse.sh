#!/usr/bin/env bash

set -o errexit # exit when a command fails 
set -o pipefail # fail when a pipe fails 
set -o nounset # fail on access of nonexistent variable
# set -o xtrace # print all commands 

cd /home/aidan/.config/hypem-dl/files/

######################
# parse json files
rm -f parsed-json.txt

if [ -f "data.js" ] 
then
	echo "parsing data.js"
	sed 's|,|\n|g' data.js >> parsed-json.txt
fi

json_counter="1"

while [ -f "data.js.$json_counter" ]
do
	echo "parsing data.js.$json_counter"
	sed 's|,|\n|g' data.js.$json_counter >> parsed-json.txt
	((json_counter++))
done

#################
# sort each desired item 

rm -f artists.txt
grep '"artist"' parsed-json.txt >> artists.txt
sed -i 's/"artist"//g' artists.txt

rm -f titles.txt
grep '"title"' parsed-json.txt >> titles.txt
sed -i 's/"title"//g' titles.txt

rm -f date_loved.txt
grep '"user_dateloved"' parsed-json.txt >> date_loved.txt
sed -i 's/"user_dateloved"//g' date_loved.txt

sed -i 's/"//g' artists.txt titles.txt date_loved.txt 
sed -i 's/://g' artists.txt titles.txt date_loved.txt 

################
# convert date format
rm -f date_loved_converted.txt
while IFS= read -r line
do
	date -d @$line +%F-%H-%M >> date_loved_converted.txt
done < date_loved.txt

