@echo off

set username=%1
IF [%1] == [] set /p "username=Enter username: "

mkdir "C:\NatroPack\data\users\%username%"
echo. 2> "C:\NatroPack\data\users\%username%\title.txt"