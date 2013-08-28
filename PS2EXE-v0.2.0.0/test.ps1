#Demo file for use with PS2EXE (http://ps2exe.codeplex.com)

write-host "PS2EXE by Ingo Karstein" -f Cyan
write-host ""
write-host "See " -f Yellow
write-host "   http://ps2exe.codeplex.com" -f Green
write-host "   http://ikarstein.wordpress.com" -f Green
Write-Host ""

$intptrSize = [System.IntPtr]::Size

if( $intptrSize -eq 4 ) {
	Write-Host "This is a 32 bit environment" -ForegroundColor Blue
} else {
	Write-Host "This is a 64 bit environment" -ForegroundColor Blue
}