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
    Write-Host $i
    $i++
} until ($i -gt 100)