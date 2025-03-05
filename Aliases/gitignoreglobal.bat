@echo off

set folderLocation=%USERPROFILE%\.config\git
set fileLocation=%folderLocation%\ignore

if not exist "%folderLocation%" (
    mkdir "%folderLocation%" /p
)

if not exist "%fileLocation%" (
    type nul > "%fileLocation%"
)

notepad "%fileLocation%"
