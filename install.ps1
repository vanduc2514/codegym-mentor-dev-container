# This funtion makesuse of the Github API https://docs.github.com/en/rest and recursively download 
# all of the files in a folder from a Github repo
# Original Author: https://gist.github.com/chrisbrownie/f20cb4508975fb7fb5da145d3d38024a
function Get-FilesFromRepo {
Param(
    [string]$Path,
    [string]$DestinationPath
    )

    $baseUri = "https://api.github.com/"
    $fullPath = "repos/vanduc2514/vscode-devcontainer/contents/$Path"
    $wr = Invoke-WebRequest -Uri $($baseuri+$fullPath)
    $objects = $wr.Content | ConvertFrom-Json
    $files = $objects | Where-Object {$_.type -eq "file"} | Select-Object -exp download_url
    $directories = $objects | Where-Object {$_.type -eq "dir"}
    
    # Recursive looking until we find a download_url for a file
    $directories | ForEach-Object { 
        Get-FilesFromRepo -Path $_.path -DestinationPath $($DestinationPath+$_.name)
    }

    
    if ($DestinationPath -and -not (Test-Path $DestinationPath)) {
        # Destination path does not exist, let's create it
        try {
            New-Item -Path $DestinationPath -ItemType Directory -ErrorAction Stop
        } catch {
            throw "Could not create path '$DestinationPath'!"
        }
    }

    foreach ($file in $files) {
        $fileDestination = Join-Path $DestinationPath (Split-Path $file -Leaf)
        try {
            Invoke-WebRequest -Uri $file -OutFile $fileDestination -ErrorAction Stop -Verbose
            "Grabbed '$($file)' to '$fileDestination'"
        } catch {
            throw "Unable to download '$($file.path)'"
        }
    }

}

$containerName=$args[0]
Get-FilesFromRepo -Path $containerName -DestinationPath ''