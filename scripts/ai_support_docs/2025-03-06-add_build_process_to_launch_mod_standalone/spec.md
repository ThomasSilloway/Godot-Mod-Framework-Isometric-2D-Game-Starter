# TODO: Ran into tons of issues with this one

# Add Standalone Mod Build Process

## High Level Overview

Add capability to build standalone executable versions of mods using the new "Windows Executable" export preset, without requiring the full mod system and startup package.

The implementation will:
1. Create a new build_standalone.bat script that takes a mod name as input
2. Use the Windows Executable preset from export_presets.cfg
3. Output logs similar to the existing build process
4. Support running the mod directly without startup.exe

## End State (Feedback Loop)

- New build_standalone.bat script in scripts folder
- Build process creates runnable .exe and .pck files
- Console output is properly captured and logged
- Standalone builds work independently of startup package

## File Structure

```
scripts/
├── build_standalone.bat        # New: Standalone mod build script
├── python/
│   ├── build_standalone.py    # New: Python implementation
│   └── utils/
│       └── standalone.py      # New: Standalone build utilities
```

## Implementation Details

### 1. Batch Script Interface

Create build_standalone.bat:
```batch
@echo off
cd /d %~dp0
cd ..
set PYTHONPATH=%CD%
uv run %~dp0\python\build_standalone.py %*
```

### 2. Python Implementation

Create build_standalone.py with:
- Mod name validation
- Export preset configuration - Use "Windows Executable" preset
- Build output organization
- Console logging setup

### 3. Build Process Flow

1. Validate mod name input
2. Configure export paths
3. Run Godot export process
4. Capture and log console output

## Tasks (Aka Prompts)

1. Create Basic Structure
```
- Add build_standalone.bat to scripts folder
- Create build_standalone.py
- Set up proper argument handling
```

2. Implement Build Logic
```
- Add mod validation
- Configure export paths
- Set up logging
- Implement export process
```

3. Handle Console Output
```
- Capture Godot export output
- Format log files
- Provide user feedback
```

4. Test Implementation
```
- Verify standalone builds work
- Test console output
- Validate exe runs independently
```

## Additional Notes

- Keep consistent with existing build_one_mod.bat pattern
- Ensure proper error handling
- Maintain logging format consistency
- Support both developer and end-user scenarios

## Reference Files

- build_one_mod.bat - Base script pattern
- export_presets.cfg - Export configuration
- build_utils.py - Existing build utilities

## Testing Instructions

### VS Code Task
The implementation includes a VS Code task for easy testing:

1. Open the Command Palette (Ctrl+Shift+P)
2. Type "Tasks: Run Task"
3. Select "Build Isometric 2D Prototype (Standalone)"

This will:
- Execute build_standalone.bat with "isometric_2d_prototype" as the argument
- Show the build output in a new terminal panel
- Create standalone executable files in the build output directory

### Expected Results
- A new build directory should be created with timestamp
- Should contain standalone .exe and .pck files
- Console output should be visible in the VS Code terminal
- The executable should run independently without startup.exe

### Validation Steps
1. Run the VS Code task "Build Isometric 2D Prototype (Standalone)"
2. Check the build output directory for new files
3. Verify console output shows successful build
4. Test running the standalone executable directly