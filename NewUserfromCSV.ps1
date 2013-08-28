import-csv accounts.csv | ForEach-Object {new-aduser -Name $_.Name -SamAccountName $_.samaccountname -GivenName $_.givenname -Surname $_.surname -title $_.title -department $_.department -Displayname $_.displayname -path $_.ou -Accountpassword (convertto-securestring $_.accountpassword -asplaintext -force)-enabled $true}