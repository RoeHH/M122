# SummenFunktion
# Rouven
# Friday: 22.October.2021 13:25
# sumFunction.ps1

function mSumRet ([int]$z1,[int]$z2) { #Wichtig type Casting
    return $z1 + $z2
} 
mSumRet 4 3 | Write-Host 
mSumRet -1 -3 | Write-Host 
mSumRet 3 (mSumRet 100 100) | Write-Host