# Instalando DbaTools
Install-Module dbatools


# Algunos comandos de DbaTools

#Listar inicios de sesión
Get-DbaLogin -SqlInstance localhost | ft Name, LoginType, SQLInstance

#Listar usuarios y logins
Get-DbaDbUser -SqlInstance localhost | Where Database -eq YellowHouse |ft Name,login 

#Ver los archivos y su tamaño de una base de datos: Get-DbaDatabaseSpace
Get-DbaDbSpace -SqlInstance localhost | where Database -eq YellowHouse |ft Physicalname, Filegroup,filesizemb,percentused,autogrowth 