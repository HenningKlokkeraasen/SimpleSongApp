$ht = @{}
Get-ChildItem "..\data" | Foreach-Object {
    $json = Get-Content $_.FullName | ConvertFrom-Json 
    $heading = $json.heading
    $htmlFileName = $_.Name.Replace(".json", ".html")
    $ht.Add($htmlFileName, $htmlFileName)
    "<!DOCTYPE html>`n<h1>$heading</h1>" | Out-File "..\site\$htmlFileName" -Force -Encoding utf8
}
$ht.keys | Foreach-Object {$index} {$index += "  <li><a href='$_'>$_</a></li>`n"} {$index}
"<!DOCTYPE html>`n<h1>Index</h1>`n<ul>`n$index</ul>" | Out-File "..\site\index.html" -Force -Encoding utf8