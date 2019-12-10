. '.\GetRandomPort.ps1'

function Copy-Release($src, $dst)
{
    $exclude = @('*.ps1')
    Write-Host $dst
    Copy-Item -Path $src -Destination $dst -Recurse -Exclude $exclude

}
function GetDstFolder($folder, $baseName) {
    $port = Get-RandomPort
    $env:CurrentPort = $port

    return  [System.IO.Path]::Combine($folder, 'instance_on_port_' + $port)
}

function Transform($srcFolder) {
    $settingsFilePath = [System.IO.Path]::Combine($srcFolder, 'settings.json');
    $resStr = "{ ""port"": ""$env:CurrentPort""}"
    $resStr | Out-File -FilePath $settingsFilePath -Encoding ASCII
}


function Start-Application($srcFolder) {
    $mainFilePath = [System.IO.Path]::Combine($srcFolder, 'index.js');
    & node $mainFilePath
}

$src = 'D:\src'
$dstContainer = 'D:\Apps' 

$dstFolder = GetDstFolder $dstContainer

Transform $src
Copy-Release $src $dstFolder
Start-Application $dstFolder