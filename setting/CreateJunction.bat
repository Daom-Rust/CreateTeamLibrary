@echo off
setlocal EnableDelayedExpansion

:: Detect if the script is running in PowerShell
set psDetect=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe
for /f "delims=" %%i in ('%psDetect% -Command "Write-Output 1"') do (
    set psCheck=%%i
)

if "%psCheck%"=="1" (
    :: Running in PowerShell
    %SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -File "setting\CreateJunction.ps1" -JunctionBasePath "C:\src" -TargetPath "%cd%"
) else (
    :: Running in CMD
    set target=%cd%
    for %%i in ("%cd%") do set currentDirName=%%~nxi
    set junctionPath=C:\src\%currentDirName%

    if exist "%junctionPath%" (
        rmdir "%junctionPath%"
    )

    mklink /J "%junctionPath%" "%target%"
)

endlocal
pause
