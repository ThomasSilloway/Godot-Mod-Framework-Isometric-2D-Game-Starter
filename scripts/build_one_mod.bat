@echo off
setlocal

:: This script builds one mod
:: Usage: build_one_mod.bat mod_name
:: Example: build_one_mod.bat main_menu

:: Check if mod name parameter was provided
if "%~1"=="" (
    echo Error: No mod name provided
    echo Usage: build_one_mod.bat mod_name
    exit /b 1
)

set mod_name=%~1

:: Get the current date and time
for /f "tokens=1-7 delims=/: " %%a in ("%date% %time%") do (
    set day=%%c
    set dayofweek=%%a
    set month=%%b
    set year=%%d
    set hour=%%e
    set minute=%%f
    set second=%%g
)

:: Add leading zero to hour if less than 10
if %hour% LSS 10 set hour=0%hour%

:: Format seconds to only 2 digits
set second=%second:~0,2%

:: Format the date and time
set datetime=%year%-%month%-%day%_%hour%-%minute%-%second%

:: Define paths
:: Set your godot executable path here
set godot_path="C:\Godot\Godot_v4.4-beta4_win64"
:: Get the script's directory
set "script_dir=%~dp0"
pushd %script_dir%..
set "workspace_root=%cd%"
popd

:: Set paths relative to workspace root
set project_path=%workspace_root%\projects\
set export_path=%workspace_root%\build\
set export_path_file=startup.exe
set run_path_file=startup.console.exe
set startup_project_path=startup\
set export_path_mod=mods\
set mod_filetype=.zip

:: Create directories for the new build
set new_build_path=%export_path%%datetime%\
mkdir "%new_build_path%"
mkdir "%new_build_path%%export_path_mod%"

:: Find the previous successful build path
set has_previous_build=false
for /f "delims=" %%F in ('dir /ad /b /o-d "%export_path%" ^| findstr /v /i "^%datetime%$"') do (
    set "latest_folder=%%F"
    set has_previous_build=true
    goto :found_previous
)

:found_previous
if "%has_previous_build%"=="true" (
    echo Found previous build: %latest_folder%
    
    :: Copy the files from the latest folder into the current export folder
    echo Copying files from previous build to new build...
    xcopy "%export_path%%latest_folder%\*" "%new_build_path%" /E /Y
) else (
    echo No previous build found. Creating a fresh build.
    
    :: If no previous build, ensure mod_order.yaml exists
    if exist "%script_dir%mod_order_template.yaml" (
        echo Copying mod_order template...
        copy "%script_dir%mod_order_template.yaml" "%new_build_path%%export_path_mod%mod_order.yaml"
    )
)

:: Export mod project
echo Building mod: %mod_name%
%godot_path% --headless --path %project_path%%mod_name% --export-pack "Windows Desktop" %new_build_path%%export_path_mod%%mod_name%%mod_filetype%

:: Check if the export was successful
if exist "%new_build_path%%export_path_mod%%mod_name%%mod_filetype%" (
    echo Mod build successful: %mod_name%
    
    :: Check if the main executable exists (from a previous build or startup build)
    if exist "%new_build_path%%run_path_file%" (
        echo Executable found. Running the game...
        cd /d "%new_build_path%"
        echo Running: "%run_path_file%"
        start "" "%run_path_file%"
    ) else (
        echo No executable found. You may need to build the startup project first.
    )
) else (
    echo Build failed for mod: %mod_name%
)

endlocal