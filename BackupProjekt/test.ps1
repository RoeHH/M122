
function createHeadOfLogfile () {
    "File Name:  $logfileDir"| writeLineToLogfile
    ""| writeLineToLogfile
    "Operation      Time        DateiName"| writeLineToLogfile 
    "------------------------------------"| writeLineToLogfile
}

function writeLineToLogfile ([string] $str) {
    $str | Add-Content -Path C:\temp\log.txt
}

function copyElementsInDirectory ([string]$dir) {
    foreach ($file in (Get-ChildItem -Path $dir -File)) {
        $time = Get-Date -Format "dd.MM.yyyy HH:mm:ss"
        $fileName = $file.Name
        "Copying File $time $fileName" | writeLineToLogfile
    }
    foreach ($file in (Get-ChildItem -Path $dir -Directory)) {
        #Write-Host "Do kopieremer de ordener: $file"
        copyElementsInDirectory $file
    }
}
copyElementsInDirectory C:\Users\vmadmin\Documents\lilalu

