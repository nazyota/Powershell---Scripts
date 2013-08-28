import-module activedirectory
Function CheckUsername ($Uname) {
  $UserN = $Uname
  $ObjFilter = "(&(objectCategory=person)(objectCategory=User)(samaccountname=$UserN))" 
  $User = Get-ADUser -Filter {sAMAccountName -eq $UserN}
$objSearch = New-Object System.DirectoryServices.DirectorySearcher 
$objSearch.Filter = $ObjFilter  
# $objSearch.SearchRoot = "LDAP://ou=Remove this if you dont want only users in a OU returned,dc=Domain,dc=co,dc=uk" 
$AllObj = $objSearch.findOne()
$user = [ADSI] $AllObj.path
$ErrorActionPreference = "silentlycontinue"
If ($User -eq $Null) {
return $false
}
Else 
{
return $true   }
}

function GenerateUserName($fields) {
$firstname=$fields[2]
$lastname=$fields[1]

$fn1=$firstname.substring(0,1)+$lastname
$fn2=$firstname.substring(0,2)+$lastname
$fn3=$firstname.substring(0,3)+$lastname
write-host (checkusername ($fn1))

if (checkusername $fn1=$true set-variable -name ($upn) 
else {
if (checkusername ($fn2)=$false) {$myfunvar=$fn2} }
else {
if (checkusername ($fn3)=$true) {$myfunvar=$fn3}}

write-host "--> " $myfunvar
return $myfunvar
}


import-module activedirectory
$file = Get-Content .\test.txt
foreach ($row in $file) {
  $fields = $row.Split('|')
  New-Object PSObject -Property @{
    LastName=$fields[1]
    FirstName=$fields[2]
    Title=$fields[7]
    Department=$fields[8]}

$firstname=$fields[2]
$lastname=$fields[1]
$displayname=$fields[1] + ", " + $fields[2]
##$upn=$Firstname.substring(0,1)+$Lastname



$upn=GenerateUserName($fields)

write-host $upn . "<-    here"
Write-host new-aduser -Name $fields[2] -Department $fields[8] -title $fields[7] -Description $fields[7] -Surname $fields[1] -DisplayName $displayname -GivenName $fields[2] -UserPrincipalName $upn
 }
