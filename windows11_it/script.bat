@echo off

:: Enable animation effects in accessibility visual effects
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Accessibility" /v AnimationEffects /t REG_DWORD /d 1 /f

:: Enable animation effects in accessibility visual effects
reg add "HKCU\Control Panel\Accessibility" /v AnimationDisabled /t REG_DWORD /d 0 /f

:: Enable menu animations
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f

:: Enable Animate controls and elements inside windows
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name MinAnimate -Value 1

:: Enable Animate windows when minimizing and maximizing
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name TaskbarAnimations -Value 1

:: Enable animation effects in accessibility visual effects
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Accessibility" -Name AnimationEffects -Value 1

:: Enable window animations
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 1 /f

:: Enable animation effects
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 1 /f

:: Enable Animate controls and elements inside windows
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 1 /f

:: Enable Animate windows when minimizing and maximizing
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 1 /f

:: Enable Animate windows when minimizing and maximizing via system properties
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 3 /f

:: Enable Animate controls and elements inside windows
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 1 /f

:: Enable Animate windows when minimizing and maximizing
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 1 /f

:: Enable Animation effects (enable "Animate controls and elements inside windows")
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 1 /f

:: Enable taskbar animations
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 1 /f

:: Enable smooth scrolling list boxes
reg add "HKCU\Control Panel\Desktop" /v SmoothScroll /t REG_SZ /d 1 /f

:: Enable transparency effects
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 1 /f

:: Set system to dark mode
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 1 /f

:: Modify individual visual effects settings (optional, for full best appearance effect)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewShadow /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 1 /f

:: This script sets Windows visual effects to "Adjust for best appearance"
:: Modify the registry to set the visual effects

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9E3E078012000000 /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewShadow /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ComboBoxAnimation /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v CursorShadow /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DropShadow /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v IconUnderline /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewWatermark /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v MenuAnimation /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v MenuFade /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v SelectionFade /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TooltipAnimation /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v WebView /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v WindowAnimation /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "FolderType" /t REG_SZ /d "NotSpecified" /f

:: create python alias
copy "%USERPROFILE%\AppData\Local\Programs\Python\Launcher\py.exe" "%USERPROFILE%\AppData\Local\Programs\Python\Launcher\python.exe"
copy "%USERPROFILE%\AppData\Local\Programs\Python\Launcher\py.exe" "%USERPROFILE%\AppData\Local\Programs\Python\Launcher\python3.exe"

:: --- Telemetry and Privacy Tweaks (for Windows 10/11) ---

:: Disable Telemetry Services (might require adjustments for different Windows versions)
sc config DiagTrack start= disabled
sc config dmwappushservice start= disabled

:: Disable Advertising ID
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f

:: Disable Location Tracking
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\GlobalPrivacyControl" /v LocationTrackingAllowed /t REG_DWORD /d 0 /f

:: Disable App Telemetry
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ApplicationTelemetry" /v AllowTelemetry /t REG_DWORD /d 0 /f

:: Disable Handwriting and Typing Data Collection
reg add "HKCU\SOFTWARE\Microsoft\Input\TIP" /v Policies /t REG_DWORD /d 255 /f

:: Disable Windows Defender Sample Submission (for Windows 10)
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v SubmitSamplesConsent /t REG_DWORD /d 2 /f

:: --- End of Telemetry and Privacy Tweaks ---

setlocal

set USERPROFILE=%USERPROFILE%
set BATCH_FILE=%~f0
set HOST_IP="10.20.3.30"

:: Enable showing file extensions
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f

curl "https://portal.it.kmitl.ac.th:4081/internal/dologin.php" ^
  -H "Cache-Control: max-age=0" ^
  -H "Connection: keep-alive" ^
  -H "Content-Type: application/x-www-form-urlencoded" ^
  --data-raw "kerio_username=Maxhub+Peer+Tutor3&kerio_password="

mkdir "%USERPROFILE%\Pictures\Wallpaper"
curl -o "%USERPROFILE%\Pictures\Wallpaper\GoldenGate2.jpg" "https://raw.githubusercontent.com/TaeTanakrit0089/Windows11KMITL/main/windows11_it/wallpaper/GoldenGate2.jpg"
curl -o "%USERPROFILE%\Pictures\Wallpaper\Sequoia-Light.jpg" "https://raw.githubusercontent.com/TaeTanakrit0089/Windows11KMITL/main/windows11_it/wallpaper/Sequoia-Light.jpg"
curl -o "%USERPROFILE%\Pictures\Wallpaper\Sequoia-Dark.jpg" "https://raw.githubusercontent.com/TaeTanakrit0089/Windows11KMITL/main/windows11_it/wallpaper/Sequoia-Dark.jpg"

curl -o "%USERPROFILE%\Pictures\Wallpaper\GoldenGate2.jpg" "http://%HOST_IP%/wallpaper/GoldenGate2.jpg"
curl -o "%USERPROFILE%\Pictures\Wallpaper\Sequoia-Light.jpg" "http://%HOST_IP%/wallpaper/Sequoia-Light.jpg"
curl -o "%USERPROFILE%\Pictures\Wallpaper\Sequoia-Dark.jpg" "http://%HOST_IP%/wallpaper/Sequoia-Dark.jpg"

curl "https://portal.it.kmitl.ac.th:4081/internal/logout"


:: Change background wallpaper
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%USERPROFILE%\Pictures\Wallpaper\Sequoia-Light.jpg" /f

:: Notify the system that the settings have changed
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters

:: Restart Windows Explorer
taskkill /f /im explorer.exe
timeout /t 1 /nobreak >nul 
start explorer.exe

:: Delete the batch file itself
del "%BATCH_FILE%"
endlocal
