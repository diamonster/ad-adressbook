$curDir = $MyInvocation.MyCommand.Definition | split-path -parent 
$searchBase = "OU=users,DC=company,DC=com"
$LDAPFilter = "(&(objectCategory=Person)(objectClass=User)(mail=*)(givenName=*)(sn=*)(!userAccountControl:1.2.840.113556.1.4.803:=2))" # незаблокированные юзеры с емейлом и заполненными именем-фамилией
$tplFile = $curDir + "\addressbook.tpl" #файл с темплейтом
$outFile = "\\iiswebserver\spravochnik\index.html" # куда кладём сгенерённый файл.
$UserCount = 0
$dt=Get-Date -Format "yyyy-MM-dd HH:mm"
 
$TextContent = ""
 
import-module ActiveDirectory
 
$users = Get-ADUser -LDAPFilter $LDAPFilter -SearchBase $searchBase -SearchScope Subtree -Properties cn, displayName, telephoneNumber, ipPhone, mail, Department, Title, Office
foreach ($user in $users) {
	$TextContent = $TextContent+"            <tr><td>"+$user.displayName+"</td><td>"+$user.telephoneNumber+"</td><td>"+$user.ipPhone+"</td><td><a href=`"mailto:"+$user.mail+"`">"+$user.mail+"</a></td><td>"+$user.Title+"</td><td>"+$user.Department+"</td><td>"+$user.Office+"</td></tr>`n"
	$UserCount++
}
 
$tplText = Get-Content $tplFile -Encoding UTF8
$tplText = $tplText -replace "__content__", $TextContent
$tplText | Out-File $outFile -Encoding UTF8
 
Write-Host "$dt - done. $UserCount users exported."
