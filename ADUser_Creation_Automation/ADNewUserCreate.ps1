#Function to check Username existence…
import-csv test.csv


Function CheckUsername ($Uname) {
  $UserN = $Uname
  $ObjFilter = "(&(objectCategory=person)(objectCategory=User)(samaccountname=$UserN))" 
  $User = Get-ADUser -Filter {sAMAccountName -eq $UserN}
$objSearch = New-Object System.DirectoryServices.DirectorySearcher 
$objSearch.Filter = $ObjFilter
$AllObj = $objSearch.findOne()
$user = [ADSI] $AllObj.path
$ErrorActionPreference = "silentlycontinue"
If ($User -eq $Null) {
Write-host "Domain\$UserN does not exist in AD"
}
Else 
{
Write-host "Domain\$UserN found in AD"}
return 
}
}


import-module activedirectory

import-csv accounts2.csv | ForEach-Object {new-aduser -Name $_.Name -SamAccountName $_.samaccountname -GivenName $_.givenname -Surname $_.surname -title $_.title -department $_.department -Displayname $_.displayname -path $_.ou -Accountpassword (convertto-securestring $_.accountpassword -asplaintext -force)-enabled $true -ChangePasswordAtLogon $true -PasswordNeverExpires:$false}
