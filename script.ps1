# Check for administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Error: This script requires administrator privileges. Please right-click and select 'Run as administrator'."
    pause
    exit
}

# The following get.ps1 code is hosted on get.activated.win for massgrave.dev. For more info, please visit massgrave.dev.
# Script continues with elevated privileges
Set-ExecutionPolicy unrestricted -Force

# Enable TLSv1.2 for compatibility with older clients for current session
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

& ([ScriptBlock]::Create((irm https://get.activated.win))) /HWID-NoEditionChange

# Define the programs folder path (updated to ./programs)
$ProgramsFolder = Resolve-Path ./programs 

# Install 7-Zip
$7ZipInstaller = Join-Path $ProgramsFolder "7z2407-x64.msi"
Start-Process msiexec.exe -ArgumentList "/i `"$7ZipInstaller`" /qn" -Wait

# Install VLC
$VLCInstaller = Join-Path $ProgramsFolder "vlc-3.0.21-win64.exe"
Start-Process $VLCInstaller -ArgumentList "/S" -Wait

# --- Converted Batch Script to PowerShell ---


# Directory to download files
$DownloadDir = "$Env:USERPROFILE\Downloads\Files"

# Create the directory if it doesn't exist
if (-not (Test-Path -Path $DownloadDir -PathType Container)) {
    New-Item -Path $DownloadDir -ItemType Directory | Out-Null
}

# --- Download and extract SarabunFont.zip ---
$SarabunFontUrl = "https://github.com/TaeTanakrit0089/Windows11KMITL/raw/main/files/SarabunFont.zip"
$SarabunFontZip = "$DownloadDir\SarabunFont.zip"
$SarabunFontDest = "$DownloadDir\SarabunFont"

Invoke-WebRequest -Uri $SarabunFontUrl -OutFile $SarabunFontZip
Expand-Archive -Path $SarabunFontZip -DestinationPath $SarabunFontDest

# --- Install all fonts in SarabunFont folder ---
Get-ChildItem -Path "$SarabunFontDest\SarabunFont" -Filter "*.ttf", "*.otf" | ForEach-Object {
    Write-Host "Installing font: $($_.Name)"
    Copy-Item -Path $_.FullName -Destination "$Env:WINDIR\Fonts" -Force
}
Write-Host "Sarabun font installation completed."

# --- Download and extract WinRAR.zip ---
$WinRARUrl = "https://github.com/TaeTanakrit0089/Windows11KMITL/raw/main/files/WinRAR.zip"
$WinRARZip = "$DownloadDir\WinRAR.zip"
$WinRARDest = "$DownloadDir\WinRAR"

Invoke-WebRequest -Uri $WinRARUrl -OutFile $WinRARZip
Expand-Archive -Path $WinRARZip -DestinationPath $WinRARDest

# --- Run WinRAR installer ---
$WinRARInstaller = Get-ChildItem -Path "$WinRARDest" -Filter "WinRAR*.exe" -Recurse | Select-Object -First 1
& $WinRARInstaller.FullName 

Write-Host "Downloads, extractions, font installation, and WinRAR execution completed."