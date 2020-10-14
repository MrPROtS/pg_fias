#!/usr/bin/python3
import psycopg2
import time
import requests
import urllib.request
import os, urllib, glob
from datetime import datetime;

from dotenv import load_dotenv
dotenv_path = os.path.join(os.path.dirname(__file__), '.env')
if os.path.exists(dotenv_path):
    load_dotenv(dotenv_path)
else:
	print('not loaded .env file')
	exit()
os.environ.get('API_KEY')
conn = psycopg2.connect(dbname=os.getenv("PG_DBNAME"), user=os.getenv("PG_USER"), 
						password=os.getenv("PG_PASS"), host=os.getenv("PG_HOST"))

def Version(region):
	cursor = conn.cursor()
	cursor.execute("SELECT version FROM version where region=%s", (region,))
	res = cursor.fetchall()
	cursor.close()
	return res[0][0]

def setVersion(version,region):
	cursor = conn.cursor()

	cursor.execute("SELECT version FROM version where region=%s", (region,))
	res = cursor.fetchall()
	if res :
		cursor.execute("""UPDATE version set version=%s WHERE region=%s""", (version,region,))
		conn.commit()
	else:
		cursor.execute("""INSERT INTO version (region,version) VALUES (%s, %s)""", (region,version))
		conn.commit()
	cursor.close()
	return True

def Regions():
	cursor = conn.cursor()
	cursor.execute("SELECT * FROM regions")
	res = cursor.fetchall()
	cursor.close()
	return res

def checkRegion(region):
	cursor = conn.cursor()
	cursor.execute("SELECT count(*) FROM addressobjects where regioncode=%s", (region,))
	cnt = cursor.fetchall()[0][0]
	cursor.close()
	return cnt

def getFiasVersion(ver, latest = False):
	r = requests.get('https://fias.nalog.ru/WebServices/Public/GetAllDownloadFileInfo')
	r = r.json()

	if latest == True:
		return [r[0]['VersionId'],r[0]['FiasCompleteDbfUrl']]

	data = dict()
	for version in r:
		if ver in data:
			break
		else:
			data[version['VersionId']] = version['FiasDeltaDbfUrl']
	del data[ver]
	data = sorted(data.items())
	return data;

def getFullFias():
	latest = getFiasVersion(False,True)
	try:
		urllib.request.urlretrieve(latest[1], './dbf/full.zip')
		setVersion(latest[0],'full')
	except:
		getFullFias()

def CheckFullUpdate():
	latest = getFiasVersion(False,True)
	try:
		stat = os.stat(os.getenv('WORK_DIR')+'/dbf/'+'full.zip')
		if stat.st_size / 1024 / 1024 < 7000:
			getFullFias()
	except:
		getFullFias()
		return False
	if stat.st_ctime+2592000 < time.time():
		getFullFias()

CheckFullUpdate();

regions = Regions()
for region in regions:
	cntReg = checkRegion(region[0])
	if cntReg > 0:
		ver = Version(region[0])
		listUpdate = getFiasVersion(ver)
		for update in listUpdate:
			if os.path.isfile('./dbf/'+str(update[0])+'.zip') == False:
				urllib.request.urlretrieve(update[1], './dbf/'+str(update[0])+'.zip')
			bashCommand = './start_update.sh '+str(update[0])+'.zip'+' '+region[0]
			os.system(bashCommand)
			setVersion(update[0],region[0])
			ver = update[0]
	else:
		fullVer = Version('full')
		setVersion(fullVer,region[0])
		bashCommand = './start_update.sh full.zip'+' '+region[0]
		os.system(bashCommand)

dir = os.getenv("WORK_DIR")+"/dbf/"

for zippath in glob.iglob(os.path.join(dir, '202*.zip')):
    os.remove(zippath)

exit()

		

	



