@echo off
setlocal

:: Get the script's directory
set "script_dir=%~dp0"
pushd %script_dir%..
set "workspace_root=%cd%"
popd

:: Define the base build directory
set build_path=%workspace_root%\build\

echo Current script directory: %script_dir%
echo Workspace path: %workspace_root%
echo Builds folder path: %build_path%

:: Find the latest build folder by sorting directories by name (since they're datetime-based)
:: Skip the mods folder by adding a findstr filter
for /f "delims=" %%i in ('dir /b /ad /o-n "%build_path%" ^| findstr /v /i "^mods$"') do (
    set "latest_build=%%i"
    goto :found
)

:found
if not defined latest_build (
    echo No build folders found in %build_path%
    exit /b 1
)

set run_path_file=startup.console.exe
set full_path=%build_path%%latest_build%\%run_path_file%

:: Check if the executable exists
if exist "%full_path%" (
    echo Running latest build from: %latest_build%
    cd /d "%build_path%%latest_build%"
    start "" "%full_path%"
) else (
    echo Executable not found in the latest build directory: %full_path%
)

endlocal 