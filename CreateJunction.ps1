param (
    [string]$JunctionBasePath,
    [string]$TargetPath
)

# Get the name of the current directory
$currentDirName = Split-Path -Leaf $TargetPath
$junctionPath = Join-Path -Path $JunctionBasePath -ChildPath $currentDirName

if (Test-Path $junctionPath) {
    Remove-Item $junctionPath -Recurse -Force
}

New-Item -ItemType Junction -Path $junctionPath -Target $TargetPath
