$wu = new-object -com "Microsoft.Update.Searcher"
$totalupdates = $wu.GetTotalHistoryCount()
$wu.QueryHistory(0,$totalupdates) | Sort-Object Name | Select Tittle,Description | export-csv myupdates.csv