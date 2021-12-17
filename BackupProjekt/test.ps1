function createHeadOfLogfile ([string]$baseDir, [string]$backupDir, [string]$logfileDestination) {
    "File Name:  $global:logfileDestination" | Out-File -FilePath $global:logfileDestination -Encoding UTF8
    writeLineToLogfile " "
    writeLineToLogfile "Copy from: $baseDir"
    writeLineToLogfile "To:        $backupDir"
    writeLineToLogfile " "
    writeLineToLogfile "Operation     Time                   DateiName"  
    writeLineToLogfile "----------------------------------------------"
}

function writeLineToLogfile ([string] $str, [string]$logfileDestination) {
    $str | Add-Content -Path $global:logfileDestination -Encoding UTF8
}

function createBackup ([string]$baseDir, [string]$backupDir) {
    createHeadOfLogfile $baseDir $backupDir #Erstellen der Kopierlogdatei
    $baseDirName = (Get-Item -Path $baseDir).BaseName #Ermitteln des Basisordners
    $global:logfileDest = $backupDir + "\" + $baseDirName + "Log.txt" #Speicherort der Kopierlogdatei
    $time = Get-Date -Format "dd.MM.yyyy HH:mm:ss"
    Copy-Item $baseDir -Destination $backupDir -Recurse -Force  #Kopieren des Ordners
    foreach ($folder in (Get-ChildItem -Path $baseDir -Directory -Recurse)){
        $folderName = ".\" + $folder.FullName.Substring($baseDir.Length - (Get-Item -Path $baseDir).BaseName.Length)
        writeLineToLogfile "Copy Folder   $time    $folderName"
    }
    foreach ($file in (Get-ChildItem -Path $baseDir -File -Recurse)){
        $fileName = ".\" + $file.FullName.Substring($baseDir.Length - (Get-Item -Path $baseDir).BaseName.Length)
        writeLineToLogfile "Copy File     $time    $fileName"
    }
}

createBackup "C:\Users\vmadmin\Documents\lilalu" "C:\Users\vmadmin\Documents\Backup"

