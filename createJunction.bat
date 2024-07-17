@echo off
:: Detect if the script is running in PowerShell
setlocal EnableDelayedExpansion
set psDetect=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe
for /f "tokens=*" %%i in ('%psDetect% -Command "echo 1"') do set psCheck=%%i

if "%psCheck%"=="1" (
    :: Running in PowerShell
    %SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& {
        $target = Get-Location;
        $junctionPath = 'C:\src';
        if (Test-Path $junctionPath) {
            Remove-Item $junctionPath -Recurse -Force;
        }
        New-Item -ItemType Junction -Path $junctionPath -Target $target;
    }"
) else (
    :: Running in CMD
    set target=%cd%
    set junctionPath=C:\src

    if exist %junctionPath% (
        rmdir %junctionPath%
    )

    mklink /J %junctionPath% %target%
)