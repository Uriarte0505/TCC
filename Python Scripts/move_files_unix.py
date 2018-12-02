# -*- coding: UTF-8 -*-
import shutil
import os

source_files = '/Users/Uriarte/Downloads/mongosm-master/DATA.txt'
screenshot = '/Users/Uriarte/Downloads/mongosm-master/screen.png'
destination_folder = '/Users/Uriarte/Downloads/Results/Mongo/1'
#destination_folder = '/Users/Uriarte/Downloads/Results/Neo4j/1'
#destination_folder = '/Users/Uriarte/Downloads/Results/PostgreSQL/1'
#destination_folder = '/Users/Uriarte/Downloads/Results/Bkp/1'
count = 1
while count is not 11:
	for dirpath, dirnames, files in os.walk(destination_folder):
		if files:
			dummy,dummy,dummy,dummy,dummy,dummy,dirnum = destination_folder.split('/')
			newfolder = int(dirnum)+1
			newfolder = '/' + str(newfolder)
			dirnum = '/' + dirnum
			#print newfolder
			print(dirpath, 'has files')	
			destination_folder = destination_folder.replace(dirnum,str(newfolder))
			count = count + 1
			#print ("VOU PRO " + destination_folder )
		if not files:
			print(dirpath, 'is empty (inserting here...)')
			shutil.move(source_files,destination_folder)
			shutil.move(screenshot,destination_folder)
			count = 11
print "END"
