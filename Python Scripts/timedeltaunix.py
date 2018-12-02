from datetime import datetime
import time

# Getting sys date and splitting into variables
sysdate = time.strftime("%d/%m/%Y")
day,month,year = sysdate.split('/')

# Read file, split into lines, get time, split it 
file_read = open("DATA.txt","r") 
data = file_read.readlines(1) 
#print data
fline = data[0]
#print fline
fsysdate = data[1]
fcmpdate=fsysdate
#print fsysdate
dummy, fcmpdate, dummy2 = fcmpdate.split('/')
#print fcmpdate
sline = data[2]
#print sline
ssysdate = data[3] 
#print ssysdate
scmpdate = ssysdate
dummy, scmpdate, dummy2 = scmpdate.split('/')
#print scmpdate
fsplited = fline.split()
#print fsplited
ssplited = sline.split()
#print ssplited
start = fsplited[2]
#print start
finish = ssplited[2]
#print finish

shour,sminutes,sseconds = start.split(':')
#print shour,sminutes,sseconds

#sseconds,sdec = sseconds.split('.')
fhour,fminutes,fseconds = finish.split(':')
#print fhour,fminutes,fseconds
#fseconds,fdec = fseconds.split('.')
file_read.close()

# Calculate Delta
#init = datetime(int(year),int(month),int(fcmpdate),int(shour),int(sminutes),int(sseconds),int(sdec))
#end = datetime(int(year),int(month),int(scmpdate),int(fhour),int(fminutes),int(fseconds),int(fdec))
init = datetime(int(year),int(month),int(fcmpdate),int(shour),int(sminutes),int(sseconds))
end = datetime(int(year),int(month),int(scmpdate),int(fhour),int(fminutes),int(fseconds))
#print init
#print end
delta = end - init
#print delta
delta = str(delta)
#print("Delta:" + delta)
file_append = open("DATA.txt","a")
file_append.write("\nDelta " + delta)
file_append.close()

