@echo off

setlocal enabledelayedexpansion
set b=0
set i=2
for /f %%a in ('net localgroup natro') do (
    IF "!b!"=="1" (
        IF "%%a"=="The" (
            goto break
        )
        C:\NatroPack\bin\rdp.exe /v:127.0.0.!i! /u:%%a /p:123456 /w:1280 /h:720
        set /a i=i+1
    )
    if "%%a"=="-------------------------------------------------------------------------------" (
        set b=1
    )
)
:break

endlocal