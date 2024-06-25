@echo off

REM Directory to download files
set DOWNLOAD_DIR=%USERPROFILE%\Downloads\Files

REM Create the directory if it doesn't exist
if not exist "%DOWNLOAD_DIR%" mkdir "%DOWNLOAD_DIR%"

REM Download SarabunFont.zip
curl -L "https://github.com/TaeTanakrit0089/Windows11KMITL/raw/main/files/SarabunFont.zip" -o "%DOWNLOAD_DIR%\SarabunFont.zip"

REM Download WinRAR.zip
curl -L "https://github.com/TaeTanakrit0089/Windows11KMITL/raw/main/files/WinRAR.zip" -o "%DOWNLOAD_DIR%\WinRAR.zip"

echo Downloads completed.
pause