<#
Funktion mit und ohne Param
HR7
01.10.2021/13:00
funktion1
#>

function msgWithoutParam
{
    Write-Host "Hallo Welt"
}

function msgWithParam($name)
{
    Write-Host "Hallo $name"
}
l