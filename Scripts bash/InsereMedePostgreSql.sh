#!/bin/bash 
set -x
COUNTER=0
while [  $COUNTER -lt 10 ]; do
	echo Criando schema, adicionando extensões...
	psql -h localhost -U postgres -f "create_database.psql"
	psql -h localhost -U postgres -f "create_extension.psql" OSM
	psql -h localhost -U postgres -f "pgsnapshot_schema_0.6.sql" OSM
	psql -h localhost -U postgres -f "pgsnapshot_schema_0.6_linestring.sql" OSM
	echo "Comecando medicao... $(date +" %T")" >> DATA.txt
	echo "$(date +" %D")" >> DATA.txt
	/Users/Uriarte/Downloads/osmosis-latest/bin/osmosis --read-xml file="/Users/Uriarte/Downloads/mongosm-master/central-america-latest.osm" --write-pgsql host="localhost" database="OSM" user="postgres"
	echo "Terminando medicao... $(date +" %T")" >> DATA.txt
	echo "$(date +" %D")" >> DATA.txt
	python timedeltaunix.py
	python screenshot_taker_unix.py
	python move_files_unix_postgree.py
	psql -h localhost -U postgres -f "drop_database.psql"
	#python send_telegram.py
    let COUNTER=COUNTER+1 
done