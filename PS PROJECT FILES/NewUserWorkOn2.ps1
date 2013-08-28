import-module activedirectory
{
$user=get-aduser -filter {sAMAccountName -eq $fn1}
if ($user -eq $null) {$uname=$fn1}
else {write-host "It Worked"} 


$firstname=$fields[2]
$lastname=$fields[1]

$fn1=$firstname.substring(0,1)+$lastname
$fn2=$firstname.substring(0,2)+$lastname
$fn3=$firstname.substring(0,3)+$lastname
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
Write-host new-aduser -Name $fields[2] -Department $fields[8] -title $fields[7] -Description $fields[7] -Surname $fields[1] -DisplayName $displayname -GivenName $fields[2] -UserPrincipalName $uname
 }