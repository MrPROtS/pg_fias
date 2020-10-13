DROP TABLE IF EXISTS RoomType_temp;
DROP TABLE IF EXISTS Room_temp;

CREATE TABLE RoomType_temp AS 
  SELECT * FROM RoomType LIMIT 1;
DELETE FROM RoomType_temp;  
CREATE TABLE Room_temp AS 
  SELECT * FROM Room LIMIT 1;
DELETE FROM Room_temp;

\COPY  RoomType_temp(RMTYPEID,NAME,SHORTNAME) FROM '/home/prots/fias/dbf/roomtype.csv' WITH (FORMAT csv,DELIMITER ',', ENCODING 'UTF8');

UPDATE RoomType s SET RMTYPEID=t.RMTYPEID,
				NAME=t.NAME,
				SHORTNAME=t.SHORTNAME
			FROM RoomType ds
				INNER JOIN RoomType_temp t ON ds.RMTYPEID=t.RMTYPEID
			WHERE ds.RMTYPEID=s.RMTYPEID;	

INSERT INTO RoomType(RMTYPEID,NAME,SHORTNAME) 
	SELECT RMTYPEID,NAME,SHORTNAME FROM RoomType_temp t WHERE NOT EXISTS (SELECT * FROM RoomType os WHERE t.RMTYPEID=os.RMTYPEID);

\COPY  Room_temp(ROOMID,ROOMGUID,HOUSEGUID,REGIONCODE,FLATNUMBER,FLATTYPE,ROOMNUMBER,ROOMTYPE,CADNUM,ROOMCADNUM,POSTALCODE,UPDATEDATE,PREVID,NEXTID,OPERSTATUS,STARTDATE,ENDDATE,LIVESTATUS,NORMDOC) FROM '/home/prots/fias/dbf/room.csv' WITH (FORMAT csv,DELIMITER ',', ENCODING 'UTF8');

UPDATE Room r SET ROOMID = t.ROOMID,
			ROOMGUID = t.ROOMGUID,
			HOUSEGUID = t.HOUSEGUID,
			REGIONCODE = t.REGIONCODE,
			FLATNUMBER = t.FLATNUMBER,
			FLATTYPE = t.FLATTYPE,
			ROOMNUMBER = t.ROOMNUMBER,
			ROOMTYPE = t.ROOMTYPE,
			CADNUM = t.CADNUM,
			ROOMCADNUM = t.ROOMCADNUM,
			POSTALCODE = t.POSTALCODE,
			UPDATEDATE = t.UPDATEDATE,
			PREVID = t.PREVID,
			NEXTID = t.NEXTID,
			OPERSTATUS = t.OPERSTATUS,
			STARTDATE = t.STARTDATE,
			ENDDATE = t.ENDDATE,
			LIVESTATUS = t.LIVESTATUS,
			NORMDOC = t.NORMDOC
		FROM Room ds
			INNER JOIN Room_temp t ON ds.ROOMID=t.ROOMID
		WHERE ds.ROOMID = r.ROOMID;

INSERT INTO Room(ROOMID,ROOMGUID,HOUSEGUID,REGIONCODE,FLATNUMBER,FLATTYPE,ROOMNUMBER,ROOMTYPE,CADNUM,ROOMCADNUM,POSTALCODE,UPDATEDATE,PREVID,NEXTID,OPERSTATUS,STARTDATE,ENDDATE,LIVESTATUS,NORMDOC)
	SELECT ROOMID,ROOMGUID,HOUSEGUID,REGIONCODE,FLATNUMBER,FLATTYPE,ROOMNUMBER,ROOMTYPE,CADNUM,ROOMCADNUM,POSTALCODE,UPDATEDATE,PREVID,NEXTID,OPERSTATUS,STARTDATE,ENDDATE,LIVESTATUS,NORMDOC
		FROM Room_temp t WHERE NOT EXISTS (SELECT * FROM Room os WHERE t.ROOMID=os.ROOMID);

DROP TABLE IF EXISTS RoomType_temp;
DROP TABLE IF EXISTS Room_temp;

SELECT (SELECT COUNT(*) FROM Room) AS RoomCount,
(SELECT COUNT(*) FROM RoomType) AS RoomTypeCount;