$csvFile = "C:\b\InputFileExample.csv"
$xlsFile = "C:\b\vendor_template2.xls"

$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$workbook = $excel.Workbooks.Open($xlsFile)
$page = 'Sheet1'
$worksheet = $workbook.worksheets | where-object {$_.Name -eq $page}
$worksheet.Cells.NumberFormat = "@"

write-output "Opening $csvFile"

$i = 2
Import-Csv $csvFile | Foreach-Object { 
    $j = 1
    foreach ($prop in $_.PSObject.Properties)
    {
            $worksheet.Cells.Item($i, $j) = $prop.Value
        $j++
    }
    $i++
}

$workbook.SaveAs($xlsFile,51)
$workbook.Close()
$excel.Quit()
write-output "Success" 
