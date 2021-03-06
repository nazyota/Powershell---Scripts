Import-Module ActiveDirectory
cd AD:
$MemberList = New-Item -Type file -Force “c:\scripts\GroupMembers.csv”
Import-Csv “C:\Scripts\Groups.csv” | ForEach-Object {
$GName = $_.GroupName
$group = Get-ADGroup $GName
$group.Name | Out-File $MemberList -Encoding ASCII -Append
foreach ($member in Get-ADGroupMember $group)
{
$member.Name | Out-File $MemberList -Encoding ASCII -Append
      }
$nl = [Environment]::NewLine | Out-File $MemberList -Encoding ASCII -Append
}