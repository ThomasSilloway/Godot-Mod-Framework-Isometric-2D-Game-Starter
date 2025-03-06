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

:: Define paths
:: Set your godot executable path here
set godot_path="C:\Godot\Godot_v4.4-beta4_win64"
:: Get the script's directory
set "script_dir=%~dp0"
pushd %script_dir%..
set "workspace_root=%cd%"
popd

:: Set paths relative to script location
set project_path=%workspace_root%\projects\
set export_path=%workspace_root%\build\%datetime%\
set export_path_file=startup.exe
set run_path_file=startup.console.exe
set startup_project_path=startup\
set scripts_path=%script_dir%\

:: Print debug information
echo Current script directory: %script_dir%
echo Project path: %project_path%
echo Export path: %export_path%

set export_path_mod=mods\
set mod_filetype=.zip
set mod_name_00=main_menu
set mod_name_01=settings_menu

:: Create directories
mkdir "%export_path%"
mkdir "%export_path%%export_path_mod%"


:: Copy mod order template
copy "%scripts_path%mod_order_template.yaml" "%export_path%%export_path_mod%mod_order.yaml"

:: Export projects
%godot_path% --headless --path %project_path%%startup_project_path% --export-release "Windows Desktop" %export_path%%export_path_file%
%godot_path% --headless --path %project_path%%mod_name_00% --export-pack "Windows Desktop" %export_path%%export_path_mod%%mod_name_00%%mod_filetype%
%godot_path% --headless --path %project_path%%mod_name_01% --export-pack "Windows Desktop" %export_path%%export_path_mod%%mod_name_01%%mod_filetype%

:: Check if the main executable was created successfully
if exist "%export_path%%run_path_file%" (
	echo Build successful. Running the game...
	cd /d "%export_path%"
	echo Running: "%export_path%%run_path_file%"
	start "" "%export_path%%run_path_file%"
) else (
	echo Build failed. Executable not found.
)

endlocal
