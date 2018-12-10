$thing = Get-Content .\input3.txt
$maxwidth = 0
$maxheight = 0
$thingObject = $thing | ForEach-Object {
    $split = $_.Split(' ')
    New-Object psobject -Property @{
        id = [int]$split[0].Substring(1)
        posx = [int]$split[2].Split(',:')[0]
        posy = [int]$split[2].Split(',:')[1]
        width = [int]$split[3].Split('x')[0]
        height = [int]$split[3].Split('x')[1]
    }
}
foreach ($i in $thingObject) {
    if (($i.posx + $i.width) -gt $maxwidth) {$maxwidth = ($i.posx + $i.width)}
    if (($i.posy + $i.height) -gt $maxheight) {$maxheight = ($i.posy + $i.height)}
}
$cloth = New-Object System.Object[] $maxwidth
foreach ($i in (0..($cloth.length-1))) {
    $cloth[$i] = New-Object int[] $maxheight
}
foreach ($fabric in $thingObject) {
    foreach ($x in (1..$fabric.width)) {
        foreach ($y in (1..$fabric.height)) {
            $cloth[$fabric.posx + $x - 1][$fabric.posy + $y - 1]++
        }
    }   
}
$overlap = 0
foreach ($x in (0..($cloth.Length - 1))) {
    foreach ($y in (0..($cloth[0].Length - 1))) {
        if ($cloth[$x][$y] -gt 1) {$overlap++}
    }
}
$overlap