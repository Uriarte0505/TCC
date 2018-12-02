#!/bin/bash 
set -x
COUNTER=0 # contador do loop
while [  $COUNTER -lt 10 ]; do
	echo "Comecando medicao... $(date +" %T")" >> DATA.txt 
	echo "$(date +" %D")" >> DATA.txt
	python insert_osm_data.py chile-latest.osm
	echo "Terminando medicao... $(date +" %T")" >> DATA.txt
	echo "$(date +" %D")" >> DATA.txt
	python timedeltaunix.py
	#python screenshot_taker_unix.py
	python move_files_unix_mongo.py
	mongo osm --eval "db.dropDatabase()"
	#python send_telegram.py
    let COUNTER=COUNTER+1 
done
