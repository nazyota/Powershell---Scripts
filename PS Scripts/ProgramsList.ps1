Get-WmiObject Win32_Product | Sort-Object Name | Select Name,version,Vendor |export-csv myprogramlist.csv