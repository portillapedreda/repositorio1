#Se meten en variables el nombre de la instancia y un objeto Server con el nombre de la
#instancia:
$instancename = “CLIENTE1”
$server = New-Object –TypeName Microsoft.SqlServer.Management.Smo.Server –ArgumentList $instancename
#Podemos listar los inicios de sesión a nivel de servidor:
$server.Logins
$server.EnumWindowsUserInfo() 

#Para ver logins, usuarios roles y permisos asociados a las bases de datos utilizamos el siguiente
#script

$databases = @("Pubs","YellowHouse")
$results = @()
$databases | ForEach-Object {
 $database = $server.Databases[$_]
 $users = $database.users
 $users | Sort-Object -property name | Where-Object IsSystemObject -eq
$false | ForEach-Object {
 $user = $_
 $database.EnumObjectPermissions($user.Name) | ForEach-Object {
 $perm = $_
 $item = [PSCustomObject] @{
 Login = $user.Login
 DBUser = $user.Name
 DBName = $database.Name
 Object = $perm.ObjectName
 Permission = $perm.PermissionType
 }
 $results += $item
 }

 }
}
$results | Format-Table –AutoSize