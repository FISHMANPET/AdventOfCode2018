$thing = Get-Content .\input1.txt
$output = 0
$freqs = new-object System.Collections.ArrayList
$i = 0
while ($true) {
    $index = $i%$($thing.Length)
    $change = [int]$thing[$index]
    $output+= $change
    Write-Host "change: $change"
    Write-Host "output: $output"
    Write-Host "i:      $i"
    write-host "index:  $index"
    Write-Host "-------------"
    if ($output -in $freqs) {
        Write-Host "solution: $output"
        break
    }
    $freqs.add($output)
    $i++
}
#foreach ($line in $input) {
#    $output += [int]$line
#}
#$output