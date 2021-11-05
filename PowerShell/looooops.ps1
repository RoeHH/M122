# looopüs
# Rouven
# Friday: 05.November.2021 13:19
# looooops.ps1

function searchArrayForString ([string[]] $array,[string] $string) {
    for ($i = 0; $i -lt $array.length; $i++) {
        if ($array[$i] -match $string) {
            return $array[$i];
        }
    }
    return $string;
}

searchArrayForString('aaab', 'aaabc', 'ccc') 'ab' | Write-Host
searchArrayForString('aaab', 'aaabc', 'ccc') 'x' | Write-Host

Write-Host '---------------------------------'


function searchArrayForStringForEach ([string[]] $array,[string] $string) {
    forEach($item in $array) {
        if ($item -match $string) {
            return $item;
        }
    }
    return $string;
}

searchArrayForStringForEach('aaab', 'aaabc', 'ccc') 'ab' | Write-Host
searchArrayForStringForEach('aaab', 'aaabc', 'ccc') 'x' | Write-Host

Write-Host '---------------------------------'

function loopInPipe([int]$a,[int]$e){
    $d = 0
    $a..$e | foreach {
        $d += $_
    }
    return $d
}

loopInPipe 10 80 | Write-Host

Write-Host '---------------------------------'


# a function taht reads in input and saves the numbers in an array until you quit with enter
function readNumbers() {
    $numbers = @();
    do {
        Write-Host 'Enter a number'
        $number = Read-Host
        if ($number -ne '') {
            $numbers = $numbers + $number
        }
    } until ($number -eq '')
    if($numbers.length -eq 0) {
        $numbers = $numbers + @(0)
    }
    return $numbers
}

readNumbers | Write-Host

Write-Host '---------------------------------'

# bublesort function
function bubbleSort([int[]] $array) {
    for ($i = 0; $i -lt $array.length; $i++) {
        for ($j = 0; $j -lt $array.length - $i -1; $j++) {
            if ($array[$j] -gt $array[$j + 1]) {
                $temp = $array[$j]
                $array[$j] = $array[$j + 1]
                $array[$j + 1] = $temp
            }
        }
    }
    return $array
}

function mSorted([int[]] $array) {
    $array = bubbleSort($array)
    return $array
}

mSorted(-51, 5422, 556, 4, 5, 6, 7, 8, 9, 10) | Write-Host

Write-Host '---------------------------------'

$readen = readNumbers

mSorted $readen | Write-Host

