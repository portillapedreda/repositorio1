# Podemos crear la tabla con Invoke
Invoke-Sqlcmd -Query "CREATE TABLE xrpp.dbo.tabla2 (campo1 int, campo2 varchar(20), campo3 date);" -ServerInstance "CLIENTE1" -Database "xrpp"
# Y comprobar su existencia con:
Invoke-Sqlcmd -ServerInstance "CLIENTE1" -Database "xrpp" -Query "SELECT * FROM sys.tables"
# para borrar
Invoke-Sqlcmd -ServerInstance "CLIENTE1" -Database "xrpp" -Query "DROP TABLE tabla2"
