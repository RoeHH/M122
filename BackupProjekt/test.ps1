function createHeadOfLogfile ([string]$baseDir, [string]$backupDir) {
    "File Name:  $global:logfileDest"| Out-File -FilePath $logfileDest -Encoding UTF8
    writeLineToLogfile " "
    writeLineToLogfile "Copy from: $baseDir"
    writeLineToLogfile "To:        $backupDir"
    writeLineToLogfile " "
    writeLineToLogfile "Operation     Time                   DateiName"  
    writeLineToLogfile "----------------------------------------------"
}

function writeLineToLogfile ([string] $str) {
    $str | Add-Content -Path $global:logfileDest -Encoding UTF8
}

function createLogsForElementsInDirectory ([string]$dir, [string]$fromBaseDir) {
    foreach ($file in (Get-ChildItem -Path $dir -File)) {
        $time = Get-Date -Format "dd.MM.yyyy HH:mm:ss"
        $fileName = $fromBaseDir + "/" + $file.Name
        writeLineToLogfile "Copy File     $time    $fileName"
    }
    foreach ($folder in (Get-ChildItem -Path $dir -Directory)) {
        $time = Get-Date -Format "dd.MM.yyyy HH:mm:ss"
        $folderName = $fromBaseDir + "/" + $folder.Name
        writeLineToLogfile "Copy Folder   $time    $folderName"
        createLogsForElementsInDirectory $folder.FullName ($fromBaseDir += "/" + $folder.Name)
    }
}

function createBackup ([string]$baseDir, [string]$backupDir) {
    Copy-Item $baseDir -Destination $backupDir -Recurse -Force  #Kopieren des Ordners
    createHeadOfLogfile $baseDir $backupDir #Erstellen der Kopierlogdatei
    $baseDirName = (Get-Item -Path $baseDir).BaseName #Ermitteln des Basisordners
    $baseDirRelative = "./$baseDirName" #Ermitteln des Basisordners relativ zum aktuellen Verzeichnis
    $global:logfileDest = $backupDir + "\" + $baseDirName + "Log.txt" #Speicherort der Kopierlogdatei
    createLogsForElementsInDirectory $baseDir $baseDirRelative #Befühlen der Kopierlogdatei
}

createBackup "C:\Users\vmadmin\Documents\lilalu" "C:\Users\vmadmin\Documents\Backup"

