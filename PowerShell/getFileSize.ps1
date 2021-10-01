# getFile size
# Rouven
# 01.10.21/13:00
# getFileSize.ps1

function getLargeFiles ($length) {
    Get-ChildItem C:\Windows | Where-Object {$_.Length -ge $length}
}

#Predefined Params
function getLargeFiles2 ($location = "C:\Windows", $length = 1MB) {
    Get-ChildItem $location | Where-Object {$_.Length -ge $length}
}
<#
    getLargeFiles2 C:\temp

    Directory: C:\temp
    Mode                 LastWriteTime         Length Name
    ----                 -------------         ------ ----
    -a---          27.08.2021    14:22        7453044 Electronic Workbench Ewb 5.12.EXE
#>

<#
    PS C:\Users\vmadmin\Documents\git\M122\PowerShell> getLargeFiles2 1MB

    Get-ChildItem: C:\Users\vmadmin\Documents\git\M122\PowerShell\getFileSize.ps1:12:5
    Line |
    12 |      Get-ChildItem $location | Where-Object {$_.Length -ge $length}
        |      ~~~~~~~~~~~~~~~~~~~~~~~
        | Cannot find path 'C:\Users\vmadmin\Documents\git\M122\PowerShell\1MB' because it does not exist.
#>
<#
    PS C:\Users\vmadmin\Documents\git\M122\PowerShell> getLargeFiles2 -length 10MB
#>

