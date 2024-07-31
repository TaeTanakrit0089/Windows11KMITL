@echo off

setlocal

set USERPROFILE=%USERPROFILE%
set BATCH_FILE=%~f0
set HOST_IP="10.20.3.93"

:: Reset GitHub
echo Removing GitHub credentials...

for /f "tokens=*" %%a in ('git config --list ^| findstr /i "github.com"') do (
  git config --global --unset-all %%a
)

echo.
echo Removing global Git credentials...

git config --global --unset credential.helper
git config --global --unset user.email
git config --global --unset user.name

echo.
echo Removing cached credentials from Credential Manager...

cmdkey /list | findstr /i "git" > nul 2>&1
if %errorlevel% == 0 (
  echo Found Git credentials in Credential Manager. Removing...
  cmdkey /delete:git:https://github.com
  cmdkey /delete:git:https://oauth2
  echo Done.
) else (
  echo No Git credentials found in Credential Manager.
)

echo.
echo Git credentials have been removed.

:: Enable showing file extensions
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f

:: Reset VSCode
taskkill /im Code.exe /f
rmdir /s /q "%USERPROFILE%\.vscode\extensions"
rmdir /s /q "%USERPROFILE%\Pictures\Wallpaper"
rmdir /s /q "%USERPROFILE%\Desktop\PhysicalCom"

mkdir "%USERPROFILE%\Desktop\PhysicalCom"
mkdir "%USERPROFILE%\Pictures\Wallpaper"

echo Resetting VS Code settings...
rd /s /q "%appdata%\Code\User\settings.json"
rd /s /q "%appdata%\Code\User\keybindings.json"
rd /s /q "%appdata%\Code\User\snippets"
echo.

echo Downloading and extracting extensions.rar...

rmdir %USERPROFILE%\.vscode\extensions /s /q

curl "https://portal.it.kmitl.ac.th:4081/internal/dologin.php" ^
  -H "Cache-Control: max-age=0" ^
  -H "Connection: keep-alive" ^
  -H "Content-Type: application/x-www-form-urlencoded" ^
  --data-raw "kerio_username=Maxhub+Peer+Tutor3&kerio_password="

curl -o "%USERPROFILE%\.vscode\extensions.zip" "http://%HOST_IP%/files/extensions.zip"
curl -o "%AppData%\Code\User\settings.json" "http://%HOST_IP%/files/settings.json"
curl -o "%USERPROFILE%\Desktop\Cygwin.lnk" "http://%HOST_IP%/files/Cygwin.lnk"
curl -o "%USERPROFILE%\Desktop\PhysicalCom\expression.c" "http://%HOST_IP%/codes/expression.c"

curl -o "%USERPROFILE%\Pictures\Wallpaper\BayBridge.jpg" "http://%HOST_IP%/wallpaper/BayBridge.jpg"
curl -o "%USERPROFILE%\Pictures\Wallpaper\GoldenGate-Wide-noboat.jpg" "http://%HOST_IP%/wallpaper/GoldenGate-Wide-noboat.jpg"
curl -o "%USERPROFILE%\Pictures\Wallpaper\GoldenGate-Wide.jpg" "http://%HOST_IP%/wallpaper/GoldenGate-Wide.jpg"
curl -o "%USERPROFILE%\Pictures\Wallpaper\GoldenGate02.jpg" "http://%HOST_IP%/wallpaper/GoldenGate02.jpg"
curl -o "%USERPROFILE%\Pictures\Wallpaper\GoldenGate03.jpg" "http://%HOST_IP%/wallpaper/GoldenGate03.jpg"
curl -o "%USERPROFILE%\Pictures\Wallpaper\GoldenGate04.jpg" "http://%HOST_IP%/wallpaper/GoldenGate04.jpg"
curl -o "%USERPROFILE%\Pictures\Wallpaper\SanFrancisco01.jpg" "http://%HOST_IP%/wallpaper/SanFrancisco01.jpg"
curl -o "%USERPROFILE%\Pictures\Wallpaper\SanFrancisco02.jpg" "http://%HOST_IP%/wallpaper/SanFrancisco02.jpg"

curl "https://portal.it.kmitl.ac.th:4081/internal/logout"

"C:\Program Files\WinRAR\WinRAR.exe" x -o+ "%USERPROFILE%\.vscode\extensions.zip" "%USERPROFILE%\.vscode\"

:: Change background wallpaper
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%USERPROFILE%\Pictures\Wallpaper\GoldenGate02.jpg" /f

IF %ERRORLEVEL% EQU 0 (
    msg * Extraction completed successfully.
) ELSE (
    msg * /!\ Failed to extract the .rar file.
    color cf
    pause
)

copy "%USERPROFILE%\AppData\Local\Programs\Python\Launcher\py.exe" "%USERPROFILE%\AppData\Local\Programs\Python\Launcher\python.exe" 
copy "%USERPROFILE%\AppData\Local\Programs\Python\Launcher\py.exe" "%USERPROFILE%\AppData\Local\Programs\Python\Launcher\python3.exe" 


:: Notify the system that the settings have changed
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters

:: Restart Windows Explorer
taskkill /f /im explorer.exe
timeout /t 1 /nobreak >nul 
start explorer.exe

:: Delete the batch file itself
del "%BATCH_FILE%"
endlocal
