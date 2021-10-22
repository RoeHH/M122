# Summenfunktion mit Array als immput
# Rouven
# Friday: 22.October.2021 13:29
# sumFunctionWithArray.ps1

function mSumRet ([array]$arr) { #Wichtig type casting 
    return $arr[0] + $arr[1]
} 
$rr = mSumRet (50, 50) 
Write-Host $rr
mSumRet (20, $rr) | Write-Host