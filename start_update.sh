#!/bin/sh
workDir=/home/prots/fias
cd $workDir/dbf

#
rm -r *.DBF *.csv
unzip $1 ADDROB$2.DBF HOUSE$2.DBF ROOM$2.DBF ESTSTAT.DBF STRSTAT.DBF ROOMTYPE.DBF

if [ "$1" != "full.zip" ]
then
  rm -r $1
fi

chmod 0777 ./*.DBF
#
dbf2csv ADDROB$2.DBF > addr.csv -ie cp866 -oe utf-8
sed -i '1d' addr.csv
#
dbf2csv ESTSTAT.DBF > eststat.csv -ie cp866 -oe utf-8
sed -i '1d' eststat.csv
#
dbf2csv STRSTAT.DBF > strstat.csv -ie cp866 -oe utf-8
sed -i '1d' strstat.csv
#
dbf2csv HOUSE$2.DBF > house.csv -ie cp866 -oe utf-8
sed -i '1d' house.csv
#
dbf2csv ROOM$2.DBF > room.csv -ie cp866 -oe utf-8
sed -i '1d' room.csv
#
dbf2csv ROOMTYPE.DBF > roomtype.csv -ie cp866 -oe utf-8
sed -i '1d' roomtype.csv
rm -r *.DBF
psql fias < $workDir/sql/update_address.sql
psql fias < $workDir/sql/update_houses.sql
psql fias < $workDir/sql/update_rooms.sql
rm -r *.csv