# Funktionen
## Funktion ohne Parameter:
```ps
    function msgWithoutParam
    {
        Write-Host "Hallo Welt"
    }
```
### Ausführen
```
PS C:\Users\vmadmin\Documents\git\M122\PowerShell> msgWithoutParam

Hallo Welt
```

## Funktionen mit Parameter:
```ps
function getLargeFiles ($length) {
    Get-ChildItem C:\Windows | Where-Object {$_.Length -ge $length}
}
```
### Ausführen
```

PS C:\Users\vmadmin\Documents\git\M122\PowerShell> getLargeFiles 1MB

        Directory: C:\Windows

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---          17.09.2021    08:30        4388592 explorer.exe
-a---          17.09.2021    08:30        1072128 HelpPane.exe
```


## Funktionen mit vordefinierten Parameter:
```ps
function getLargeFiles2 ($location = "C:\Windows", $length = 1MB) {
        Get-ChildItem $location | Where-Object {$_.Length -ge $length}
}
```
### Ausführen
```
PS C:\Users\vmadmin\Documents\git\M122\PowerShell> getLargeFiles2 C:\Temp


    Directory: C:\temp

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---          27.08.2021    14:22        7453044 Electronic Workbench Ewb 5.12.EXE
```
```
PS C:\Users\vmadmin\Documents\git\M122\PowerShell> getLargeFiles2 -length 1MB


    Directory: C:\Windows

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---          17.09.2021    08:30        4388592 explorer.exe
-a---          17.09.2021    08:30        1072128 HelpPane.exe
```
```
PS C:\Users\vmadmin\Documents\git\M122\PowerShell> getLargeFiles2 C:\Temp


    Directory: C:\temp

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---          27.08.2021    14:22        7453044 Electronic Workbench Ewb 5.12.EXE
```
```
PS C:\Users\vmadmin\Documents\git\M122\PowerShell> getLargeFiles2 1MB

Get-ChildItem: C:\Users\vmadmin\Documents\git\M122\PowerShell\getFileSize.ps1:12:5
Line |
  12 |      Get-ChildItem $location | Where-Object {$_.Length -ge $length}
     |      ~~~~~~~~~~~~~~~~~~~~~~~
     | Cannot find path 'C:\Users\vmadmin\Documents\git\M122\PowerShell\1MB' because it does not exist.
    ```