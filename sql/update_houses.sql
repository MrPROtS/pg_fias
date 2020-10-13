--BEGIN TRANSACTION;

DROP TABLE IF EXISTS DeletedHouses_temp;
DROP TABLE IF EXISTS Houses_temp;
DROP TABLE IF EXISTS EstateStatus_temp;
DROP TABLE IF EXISTS StructureStatus_temp;

CREATE TABLE Houses_temp AS 
  SELECT * FROM Houses LIMIT 1;
DELETE FROM Houses_temp;  
CREATE TABLE DeletedHouses_temp AS 
  SELECT * FROM Houses LIMIT 1;
DELETE FROM DeletedHouses_temp; 
CREATE TABLE EstateStatus_temp AS 
  SELECT * FROM EstateStatus LIMIT 1;
 DELETE FROM EstateStatus_temp; 
CREATE TABLE StructureStatus_temp AS 
  SELECT * FROM StructureStatus LIMIT 1;
 DELETE FROM StructureStatus_temp; 

\COPY  EstateStatus_temp(EstateStatusID,EstateStatusNAME,EstateStatusShortName) FROM '/home/prots/fias/dbf/eststat.csv' WITH (FORMAT csv,DELIMITER ',', ENCODING 'UTF8');

UPDATE EstateStatus s SET EstateStatusNAME=t.EstateStatusNAME,
				EstateStatusShortName=t.EstateStatusShortName
			FROM EstateStatus ds
				INNER JOIN EstateStatus_temp t ON ds.EstateStatusID=t.EstateStatusID
			WHERE ds.EstateStatusID=s.EstateStatusID;	

INSERT INTO EstateStatus(EstateStatusID,EstateStatusNAME,EstateStatusShortName) 
	SELECT EstateStatusID,EstateStatusNAME,EstateStatusShortName FROM EstateStatus_temp t WHERE NOT EXISTS (SELECT * FROM EstateStatus os WHERE t.EstateStatusID=os.EstateStatusID);

\COPY StructureStatus_temp(StructureStatusID,StructureStatusNAME,StructureStatusShortName) FROM '/home/prots/fias/dbf/strstat.csv' WITH (FORMAT csv,DELIMITER ',', ENCODING 'UTF8'); 

UPDATE StructureStatus s SET StructureStatusNAME=t.StructureStatusNAME,
				StructureStatusShortName=t.StructureStatusShortName
			FROM StructureStatus ds
				INNER JOIN StructureStatus_temp t ON ds.StructureStatusID=t.StructureStatusID
			WHERE ds.StructureStatusID=s.StructureStatusID;	

INSERT INTO StructureStatus(StructureStatusID,StructureStatusNAME,StructureStatusShortName) 
	SELECT StructureStatusID,StructureStatusNAME,StructureStatusShortName FROM StructureStatus_temp t WHERE NOT EXISTS (SELECT * FROM StructureStatus os WHERE t.StructureStatusID=os.StructureStatusID);

\COPY  Houses_temp(AOGUID,BUILDNUM,ENDDATE,ESTSTATUS,HOUSEGUID,HOUSEID,HOUSENUM,STATSTATUS,IFNSFL,IFNSUL,OKATO,OKTMO,POSTALCODE,STARTDATE,STRUCNUM,STRSTATUS,TERRIFNSFL,TERRIFNSUL,UPDATEDATE,NORMDOC,COUNTER,CADNUM,DIVTYPE) FROM '/home/prots/fias/dbf/house.csv' WITH (FORMAT csv,DELIMITER ',', ENCODING 'UTF8');

UPDATE 	Houses h SET AOGUID=t.AOGUID,
			BUILDNUM=t.BUILDNUM,
			ENDDATE=t.ENDDATE,
			ESTSTATUS=t.ESTSTATUS,
			HOUSEGUID=t.HOUSEGUID,
			HOUSENUM=t.HOUSENUM,
			STATSTATUS=t.STATSTATUS,
			IFNSFL=t.IFNSFL,
			IFNSUL=t.IFNSUL,
			OKATO=t.OKATO,
			OKTMO=t.OKTMO,
			POSTALCODE=t.POSTALCODE,
			STARTDATE=t.STARTDATE,
			STRUCNUM=t.STRUCNUM,
			STRSTATUS=t.STRSTATUS,
			TERRIFNSFL=t.TERRIFNSFL,
			TERRIFNSUL=t.TERRIFNSUL,
			UPDATEDATE=t.UPDATEDATE,
			NORMDOC=t.NORMDOC,
			COUNTER=t.COUNTER,
			CADNUM=t.CADNUM, 
			DIVTYPE=t.DIVTYPE
		FROM Houses dh
			INNER JOIN Houses_Temp t ON t.HOUSEID=dh.HOUSEID
		WHERE h.HOUSEID=dh.HOUSEID;	

DELETE FROM Houses h WHERE EXISTS(SELECT 1 FROM DeletedHouses_temp delh WHERE delh.HOUSEID=h.HOUSEID);

INSERT INTO Houses(AOGUID,BUILDNUM,ENDDATE,ESTSTATUS,HOUSEGUID,HOUSEID,HOUSENUM,STATSTATUS,IFNSFL,IFNSUL,OKATO,OKTMO,POSTALCODE,STARTDATE,STRUCNUM,STRSTATUS,TERRIFNSFL,TERRIFNSUL,UPDATEDATE,NORMDOC,COUNTER,CADNUM,DIVTYPE) 
SELECT AOGUID,BUILDNUM,ENDDATE,ESTSTATUS,HOUSEGUID,HOUSEID,HOUSENUM,STATSTATUS,IFNSFL,IFNSUL,OKATO,OKTMO,POSTALCODE,STARTDATE,STRUCNUM,STRSTATUS,TERRIFNSFL,TERRIFNSUL,UPDATEDATE,NORMDOC,COUNTER,CADNUM,DIVTYPE 	
		FROM Houses_Temp t WHERE NOT EXISTS(SELECT * FROM  Houses h WHERE t.HOUSEID=h.HOUSEID);

DROP TABLE IF EXISTS DeletedHouses_temp;
DROP TABLE IF EXISTS Houses_temp;
DROP TABLE IF EXISTS EstateStatus_temp;
DROP TABLE IF EXISTS StructureStatus_temp;

--ROLLBACK TRANSACTION;
--COMMIT TRANSACTION;
SELECT (SELECT COUNT(*) FROM Houses) AS HouseCount,
(SELECT COUNT(*) FROM EstateStatus) AS EStatusCount,
(SELECT COUNT(*) FROM StructureStatus) AS SStatusCount;