@echo off

REM Directory to download files
set DOWNLOAD_DIR=%USERPROFILE%\Downloads\Files

REM Create the directory if it doesn't exist
if not exist "%DOWNLOAD_DIR%" mkdir "%DOWNLOAD_DIR%"

REM --- Download and extract SarabunFont.zip ---
curl -L "https://github.com/TaeTanakrit0089/Windows11KMITL/raw/main/files/SarabunFont.zip" -o "%DOWNLOAD_DIR%\SarabunFont.zip"
mkdir "%DOWNLOAD_DIR%\SarabunFont"
powershell -Command "Expand-Archive -Path '%DOWNLOAD_DIR%\SarabunFont.zip' -DestinationPath '%DOWNLOAD_DIR%\SarabunFont'"

REM --- Install all fonts in SarabunFont folder ---
for %%f in ("%DOWNLOAD_DIR%\SarabunFont\*.ttf" "%DOWNLOAD_DIR%\SarabunFont\*.otf") do (
    echo Installing font: "%%f"
    copy "%%f" "%WINDIR%\Fonts" /Y >nul
)
echo Sarabun font installation completed.

REM --- Download and extract WinRAR.zip ---
curl -L "https://github.com/TaeTanakrit0089/Windows11KMITL/raw/main/files/WinRAR.zip" -o "%DOWNLOAD_DIR%\WinRAR.zip"
mkdir "%DOWNLOAD_DIR%\WinRAR"
powershell -Command "Expand-Archive -Path '%DOWNLOAD_DIR%\WinRAR.zip' -DestinationPath '%DOWNLOAD_DIR%\WinRAR'"

REM --- Run WinRAR installer ---
"%DOWNLOAD_DIR%\WinRAR\WinRAR.7.01.Final.EN-TH\WinRAR.7.01_EN.exe"

echo Downloads, extractions, font installation, and WinRAR execution completed.
pause