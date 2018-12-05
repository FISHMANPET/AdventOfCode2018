$input = Get-Content .\input1.txt
$output = 0
foreach ($line in $input) {
    $output += [int]$line
}
$output