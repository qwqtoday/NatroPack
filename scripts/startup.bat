@echo off

set /p password=<C:\NatroPack\data\password.txt

setlocal EnableDelayedExpansion
set b=0
set i=2
for /f %%a in ('net localgroup natro') do (
    IF "!b!"=="1" (
        IF "%%a"=="The" (
            goto break
        )
        C:\NatroPack\scripts\connect-user.bat 127.0.0.!i! %%a "%password%"
        set /a i=i+1
    )
    if "%%a"=="-------------------------------------------------------------------------------" (
        set b=1
    )
)
:break

endlocal