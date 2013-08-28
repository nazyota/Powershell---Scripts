try {
    1/$null
} catch {
    Write-Host ("The error was: " + $_)
}
Write-Host "Continuing..."
Get-Content c:\AllWindows2.txt | Foreach-Object {Get-TSSession -computername $_ -state active} > c:\myex.csv