#!/bin/bash 
set -x
COUNTER=0
while [  $COUNTER -lt 10 ]; do
	echo "Comecando medicao... $(date +" %T")" >> DATA.txt
	echo "$(date +" %D")" >> DATA.txt
	java -cp target/classes;target/dependency/* org.neo4j.gis.spatial.osm.OSMImporter osm-db-col colombia-latest.osm
	echo "Terminando medicao... $(date +" %T")" >> DATA.txt
	echo "$(date +" %D")" >> DATA.txt
	python timedeltaunix.py
	python screenshot_taker_unix.py
	python move_files_unix_neo4j.py
	# DB drop
	trash /Users/Uriarte/spatial/1
	# Empty trash bin
	rm -rf ~/.Trash/*
	#python send_telegram.py
    let COUNTER=COUNTER+1 
done