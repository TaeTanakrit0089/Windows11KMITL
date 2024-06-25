@echo off

REM Directory to download files
set DOWNLOAD_DIR=%USERPROFILE%\Downloads\Files

REM Create the directory if it doesn't exist
if not exist "%DOWNLOAD_DIR%" mkdir "%DOWNLOAD_DIR%"

REM --- Download and extract SarabunFont.zip ---
curl -L "https://github.com/TaeTanakrit0089/Windows11KMITL/raw/main/files/SarabunFont.zip" -o "%DOWNLOAD_DIR%\SarabunFont.zip"

REM Create directory for SarabunFont extraction
mkdir "%DOWNLOAD_DIR%\SarabunFont"

REM Extract SarabunFont.zip to its directory
powershell -Command "Expand-Archive -Path '%DOWNLOAD_DIR%\SarabunFont.zip' -DestinationPath '%DOWNLOAD_DIR%\SarabunFont'"

REM --- Download and extract WinRAR.zip ---
curl -L "https://github.com/TaeTanakrit0089/Windows11KMITL/raw/main/files/WinRAR.zip" -o "%DOWNLOAD_DIR%\WinRAR.zip"

REM Create directory for WinRAR extraction
mkdir "%DOWNLOAD_DIR%\WinRAR"

REM Extract WinRAR.zip to its directory
powershell -Command "Expand-Archive -Path '%DOWNLOAD_DIR%\WinRAR.zip' -DestinationPath '%DOWNLOAD_DIR%\WinRAR'"

echo Downloads and extractions completed.
pause