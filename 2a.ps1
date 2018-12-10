$thing = Get-Content .\input2.txt
$numcontains2=0
$numcontains3=0
foreach ($line in $thing) {
    $contains2 = $false
    $contains3 = $false
    foreach ($letter in [char[]]([int][char]'a'..[int][char]'z')) {

        if (($line.ToCharArray() | Where-Object {$_ -eq $letter}).count -eq 2) {$contains2 = $true}
        if (($line.ToCharArray() | Where-Object {$_ -eq $letter}).count -eq 3) {$contains3 = $true}
    }
    if ($contains2) { $numcontains2++}
    if ($contains3) { $numcontains3++}
}
write-host "2: $numcontains2"
write-host "3: $numcontains3"