@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------


net localgroup /add natro
echo Added natro local group

mkdir "C:\NatroPack\bin"
curl "https://www.donkz.nl/download/remote-desktop-plus/" -o "C:\NatroPack\bin\rdp.exe"

mkdir "C:\NatroPack\data"
mkdir "C:\NatroPack\data\users"
set /p "password=Enter Natro Password: "
echo %password% > C:\NatroPack\data\password.txt