param (
    [string]$JunctionPath,
    [string]$TargetPath
)

if (Test-Path $JunctionPath) {
    Remove-Item $JunctionPath -Recurse -Force
}

New-Item -ItemType Junction -Path $JunctionPath -Target $TargetPath
