## First if statement checks for network connectivity and will exit if not network connectivity detected. It is doing a ping to local domain.
if ((get-wmiobject -query "Select * from win32_pingstatus where address='cgrmc.org'").ipv4address -eq $null)
{
exit}
else
{
write-host "Connected to Network"}

## The function JoinDomain is joining the computer to the domain. Change domain name and credentials based network.
function joinDomain
{
$domain = "cgrmc.org"
$password = "isonly" | ConvertTo-SecureString -asPlainText -Force
$username = "isec\duser" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential
restart-computer -force
}
## This if statement checks to see if computer is already part of a Domain. If yes it will exit.
if ((gwmi win32_computersystem).partofdomain -eq $true) 
{
    exit 
    }
else 
{
   JoinDomain
   }