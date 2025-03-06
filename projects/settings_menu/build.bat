@echo off

:: Get the script's directory
set "script_dir=%~dp0"
pushd %script_dir%..\..
set "workspace_root=%cd%"
popd

:: Call the shared build script with the mod name
call "%workspace_root%\scripts\build_one_mod.bat" settings_menu
