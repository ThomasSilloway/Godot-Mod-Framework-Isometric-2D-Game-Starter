@Echo off

IF "%~1"=="" (
    echo Please provide a test file path
    echo Usage: run_tests.bat path/to/test.gd
    exit /b 1
)

C:/Godot/Godot_v4.4-stable_win64.exe -s addons/gut/gut_cmdln.gd --path projects/isometric_2d_prototype -gtest=res://%1 -glog=1 -gexit