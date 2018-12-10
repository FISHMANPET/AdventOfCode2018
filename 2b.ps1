$thing = Get-Content .\input2.txt
$sortedthing = $thing | Sort-Object
$stringlength = $sortedthing[0].Length

$firstchar = $thing | ForEach-Object {$_.Substring(1)} | Sort-Object | Get-Unique
if ($firstchar.length -ne $sortedthing.Length) {
    Write-Host "arrays differ, first character is difference"
    break
}
$string1 = ""
$string2 = ""

foreach ($i in (0..($sortedthing.Length-2))) {
    $differences = 0
    foreach ($j in (0..($stringlength-1))) {
        if ($sortedthing[$i][$j] -ne $sortedthing[$i+1][$j]) {$differences++}
    }
    if ($differences -eq 1) {
        $string1 = $sortedthing[$i]
        $string2 = $sortedthing[$i+1]
        break
    }
}
$string3 = ""
foreach ($i in (0..($string1.Length-1))) {
    if ($string1[$i] -eq $string2[$i]) {$string3+=$string1[$i]}
}
$string3