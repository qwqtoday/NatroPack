echo off

set ip=%1
set username=%2
set password=%3

set /p title=<C:\NatroPack\data\users\%username%\title.txt

if not "%title%" == "" set titlearg= /title:"%title%"

C:\NatroPack\bin\rdp.exe /v:%ip% /u:%username% /p:%password% /nodrives /nosound /nowallpaper /w:1366 /h:768%titlearg%