# Loops in Powershell

```ps1
# Loops
# Rouven
# Friday: 05.November.2021 12:40
# loops.ps1

for ($i = 0; $i -lt 100; $i++) {
    Write-Host $i
}

$i = 0
while ($i -lt 100) {
    Write-Host $i
    $i++
}

$i = 0
do {
    Write-Host $i
    $i++
} while ($i -lt 100)

$i = 0
do {
    Write-Host $i " "
    $i++
} until ($i -gt 100)
```

## Pippe foreach
```ps1
function loopInPipe([int]$a,[int]$e){
    $d = 0
    $a..$e | foreach {
        $d += $_
    }
    return $d
}

loopInPipe 10 80 | Write-Host
```