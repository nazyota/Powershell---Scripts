if ((gwmi win32_computersystem).partofdomain -eq $true) {
    joinDomain
} else {
    joinDomain
}


function joinDomain
{
$domain = "cgrmc.org"
$password = "isonly" | ConvertTo-SecureString -asPlainText -Force
$username = "isec\duser" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential
restart-computer -force
}