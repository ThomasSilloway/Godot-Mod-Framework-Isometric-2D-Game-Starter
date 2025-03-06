@echo off
setlocal

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

:: Define paths (relative to workspace root)
:: Set your godot executable path here
set godot_path="C:\Godot\Godot_v4.4-beta4_win64"

:: Get the script's directory
set "script_dir=%~dp0"
pushd %script_dir%..\..
set "workspace_root=%cd%"
popd


:: Set paths relative to workspace root
set project_path=%workspace_root%\projects\
set export_path=%workspace_root%\build\
set export_path_file=startup.exe
set run_path_file=startup.console.exe
set startup_project_path=startup\
set scripts_path=%workspace_root%\scripts\
set export_path_mod=mods\

:: Find the previous successful build path
set prev_build_path=
for /f "delims=" %%F in ('dir /ad /b /o-d "%export_path%"') do (
    set "latest_folder=%%F"
    goto :found
)

:found
echo Most recent folder: %latest_folder%

:: Create directories
mkdir "%export_path%%datetime%\"
mkdir "%export_path%%datetime%\%export_path_mod%"

:: Copy the mod files from the latest folder
if exist "%export_path%%latest_folder%\%export_path_mod%" (
    echo Copying mods from previous build...
    xcopy "%export_path%%latest_folder%\%export_path_mod%*" "%export_path%%datetime%\%export_path_mod%" /E /Y
)

:: Copy mod order template
copy "%scripts_path%mod_order_template.yaml" "%export_path%%datetime%\%export_path_mod%mod_order.yaml"

:: Export startup project
%godot_path% --headless --path "%project_path%%startup_project_path%\" --export-release "Windows Desktop" "%export_path%%datetime%\%export_path_file%"

:: Check if the startup executable was created successfully
if exist "%export_path%%datetime%\%run_path_file%" (
    echo Build successful. Running the game...
    cd /d "%export_path%%datetime%\"
    echo Running: "%export_path%%datetime%\%run_path_file%"
    start "" "%export_path%%datetime%\%run_path_file%"
) else (
    echo Build failed. Executable not found.
)

endlocal 