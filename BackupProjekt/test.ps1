function createHeadOfLogfile ([string]$baseDir, [string]$backupDir, [string]$logfileDestination) {
    "File Name:  $logfileDestination" | Out-File -FilePath $logfileDestination -Encoding UTF8
    writeLineToLogfile " "
    writeLineToLogfile "Copy from: $baseDir"
    writeLineToLogfile "To:        $backupDir"
    writeLineToLogfile " "
    writeLineToLogfile "Operation     Time                   DateiName"  
    writeLineToLogfile "----------------------------------------------"
}

function writeLineToLogfile ([string] $str, [string]$logfileDestination) {
    $str | Add-Content -Path $logfileDestination -Encoding UTF8
}

function createBackup ([string]$baseDir, [string]$backupDir) {
    $logfileDest = $backupDir + "\" + (Get-Item -Path $baseDir).BaseName + "Log.txt" #Speicherort der Kopierlogdatei
    Write-Host $logfileDest
    createHeadOfLogfile $baseDir $backupDir $logfileDest #Erstellen der Kopierlogdatei
    $time = Get-Date -Format "dd.MM.yyyy HH:mm:ss"
    Copy-Item $baseDir -Destination $backupDir -Recurse -Force  #Kopieren des Ordners
    foreach ($folder in (Get-ChildItem -Path $baseDir -Directory -Recurse)){
        $folderName = ".\" + $folder.FullName.Substring($baseDir.Length - (Get-Item -Path $baseDir).BaseName.Length)
        writeLineToLogfile "Copy Folder   $time    $folderName" $logfileDest
    }
    foreach ($file in (Get-ChildItem -Path $baseDir -File -Recurse)){
        $fileName = ".\" + $file.FullName.Substring($baseDir.Length - (Get-Item -Path $baseDir).BaseName.Length)
        writeLineToLogfile "Copy File     $time    $fileName" $logfileDest
    }
}

createBackup "C:\Users\vmadmin\Documents\lilalu" "C:\Users\vmadmin\Documents\Backup"

