DROP TABLE IF EXISTS regions_temp;

CREATE TABLE regions_temp AS 
  SELECT * FROM regions LIMIT 1;
DELETE FROM regions_temp;

\COPY  regions_temp(name,code) FROM './regions.csv' WITH (FORMAT csv,DELIMITER ',', ENCODING 'UTF8');

UPDATE regions s SET name=t.name,
				code=t.code
			FROM regions ds
				INNER JOIN regions_temp t ON ds.code=t.code
			WHERE ds.code=s.code;	

INSERT INTO regions(name,code) 
	SELECT name,code FROM regions_temp t WHERE NOT EXISTS (SELECT * FROM regions os WHERE t.code=os.code);

DROP TABLE IF EXISTS regions_temp;