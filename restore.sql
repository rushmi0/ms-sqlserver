USE [master];
RESTORE DATABASE [AdventureWorks2019]
FROM DISK = N'/backup/AdventureWorks2019.bak'
WITH MOVE 'AdventureWorks2017' TO '/var/opt/mssql/data/AdventureWorks2019.mdf',
     MOVE 'AdventureWorks2017_log' TO '/var/opt/mssql/data/AdventureWorks2019_log.ldf',
     REPLACE;
