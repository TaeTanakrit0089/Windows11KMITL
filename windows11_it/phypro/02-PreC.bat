@echo off
setlocal

set USERPROFILE=%USERPROFILE%
set BATCH_FILE=%~f0
set HOST_IP="10.20.3.93"

:: Remove PhysicalCom folder
rd /s /q "%USERPROFILE%\Desktop\PhysicalCom"

:: Delete All Files in Desktop
del /q "%USERPROFILE%\Desktop\*.py"
del /q "%USERPROFILE%\Desktop\*.*rap*"
del /q "%USERPROFILE%\Desktop\*.rap"
del /q "%USERPROFILE%\Desktop\*.c"

:: Delete Downloads
del /q /f /s "%USERPROFILE%\Downloads\*"

mkdir "%USERPROFILE%\Desktop\PhysicalCom"

curl "https://portal.it.kmitl.ac.th:4081/internal/dologin.php" ^
  -H "Cache-Control: max-age=0" ^
  -H "Connection: keep-alive" ^
  -H "Content-Type: application/x-www-form-urlencoded" ^
  --data-raw "kerio_username=Maxhub+Peer+Tutor3&kerio_password="

curl -o "%USERPROFILE%\Desktop\PhysicalCom\hello.c" "http://%HOST_IP%/hello.c"

curl "https://portal.it.kmitl.ac.th:4081/internal/logout"

:: Delete the batch file itself
del "%BATCH_FILE%"
endlocal
