@echo off

setlocal enabledelayedexpansion
set b=0
for /f %%a in ('net localgroup natro') do (
    IF "!b!"=="1" (
        IF "%%a"=="The" (
            goto break
        )
        echo %%a
    )
    if "%%a"=="-------------------------------------------------------------------------------" (
        set b=1
    )
)
:break

endlocal