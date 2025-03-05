@echo off

:: Define base directory and paths
set "base_dir=%LOCALAPPDATA%\Programs\Python"
set "python_dir=Python%1"
set "python_path=%base_dir%\%python_dir%"
set "scripts_path=%python_path%\Scripts"

:: Check if both directories exist
if exist "%python_path%" (
    if exist "%scripts_path%" (
        :: Temporarily add paths to PATH for this session
        set "PATH=%scripts_path%;%python_path%;%PATH%"
        echo Found and added to PATH:
        echo %scripts_path%
        echo %python_path%
    ) else (
        echo One or both directories not found.
    )
) else (
    echo No Python installation found for version '%1' in '%base_dir%'.
)
