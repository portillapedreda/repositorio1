Invoke-Sqlcmd –query “select @@version”
Invoke-Sqlcmd –ServerInstance CLIENTE1 –Database Master –Query “SELECT Name FROM
sys.databases” 

Invoke-Sqlcmd –Database YellowHouse –Query “SELECT * FROM Datos_Aspecto”