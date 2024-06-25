# The following get.ps1 code is hosted on get.activated.win for massgrave.dev. For more info, please visit massgrave.dev.
# Script continues with elevated privileges
Set-ExecutionPolicy unrestricted -Force

# Enable TLSv1.2 for compatibility with older clients for current session
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

& ([ScriptBlock]::Create((irm https://get.activated.win))) /HWID-NoEditionChange

# Define the programs folder path
$ProgramsFolder = Resolve-Path ..\programs

# Install 7-Zip
$7ZipInstaller = Join-Path $ProgramsFolder "7z2407-x64.msi"
Start-Process msiexec.exe -ArgumentList "/i `"$7ZipInstaller`" /qn" -Wait

# Install VLC
$VLCInstaller = Join-Path $ProgramsFolder "vlc-3.0.21-win64.exe"
Start-Process $VLCInstaller -ArgumentList "/S" -Wait