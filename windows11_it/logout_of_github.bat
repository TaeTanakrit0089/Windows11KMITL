@echo off

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

pause