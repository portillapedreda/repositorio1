#Para hacer un backup de una base de datos se utiliza el comando Backup-sqldatabase. Se le da
#el nombre de la instancia, el de la base de datos y el nombre y ruta del archivo de backup.

#Se puede almacenar la fecha y hora en una variable para así meterla en el nombre del archivo:
$dt=Get-Date –Format yyyMMddHHss
#Para facilitar el uso de los datos podemos meter la instancia y el nombre de la base de datos
#en variables.
$instancename = “CLIENTE1”
$dbname = “Pubs”
Backup-SqlDatabase –ServerInstance $instancename –Database $dbname –Backupfile “c:\Backup\($dbname)_db_($dt).bak" 


Invoke-Sqlcmd –Database “Master” –Query “DROP DATABASE Pubs”
Restore-SqlDatabase –ServerInstance $instancename –Database $dbname –BackupFile “c:\Backup\($dbname)_db_($dt).bak” 
