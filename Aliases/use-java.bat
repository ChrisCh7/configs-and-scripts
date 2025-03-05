@echo off
setlocal enabledelayedexpansion

:: Check if an argument is provided
if "%1"=="" (
    echo Usage: %~n0 [JDK version number]
    exit /b 1
)

:: Get the JDK version number from the first argument
set number=%1

:: Define the base directory to search in
set baseDir=C:\Program Files\Eclipse Adoptium

:: Search for a folder starting with "jdk-%number%"
for /d %%F in ("%baseDir%\jdk-%number%*") do (
    :: Check if the folder exists
    if exist "%%F" (
        :: Get the path to the "bin" folder
        set binPath=%%F\bin

        :: Temporarily add the "bin" folder to the PATH for the current shell session
        set PATH_NEW=!binPath!;!PATH!

        echo Found and added to PATH: !binPath!
        goto :end
    )
)

:: If no matching folder is found
echo No folder starting with "jdk-%number%" was found in "%baseDir%".
goto :eof

:end
endlocal & set PATH=%PATH_NEW%
