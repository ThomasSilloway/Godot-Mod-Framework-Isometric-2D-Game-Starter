# Converting Batch Files to Python Scripts

## High Level Overview

Convert the build_one_mod.bat and build.bat scripts to Python scripts that share common functionality while maintaining the same behavior. Create minimal batch files that call these Python scripts.

## End State (feedback Loop)

- Successfully converted build_one_mod.bat to build_one_mod.py
- Successfully converted build.bat to build.py
- Created minimal wrapper batch files that call the Python scripts
- Both scripts work correctly with the same functionality as the original batch files
- The Python code is modular and shares common functionality

## Docs

- [UV Package Documentation](c:\GithubRepos\GMF-Isometric-2D-Starter\scripts\ai_support_docs\uv-usage.md)
- [Sample Python Script](c:\GithubRepos\GMF-Isometric-2D-Starter\scripts\ai_support_docs\run-godot-game.py)

## File Structure

```
scripts/
├── build.bat                  # Minimal wrapper for build.py
├── build_one_mod.bat          # Minimal wrapper for build_one_mod.py
├── run.bat                    # (unchanged)
├── mod_order_template.yaml    # (unchanged)
├── python/
│   ├── build.py               # Python implementation of build.bat
│   ├── build_one_mod.py       # Python implementation of build_one_mod.bat
│   ├── build_utils.py         # Shared utilities for build scripts
└── ai_support_docs/
    └── ...                    # (unchanged)
```

## Implementation Details

- Use Python 3.x syntax
- Use `uv` to run the Python scripts and manage dependencies
- The Python scripts should include appropriate inline script metadata for dependencies as shown in uv-usage.md
- The Python scripts should share common code through a module structure
- Create a `build_utils.py` file for common functionality shared between scripts
- The original batch files should be replaced with minimal wrapper batch files that call the Python scripts
- All scripts should properly handle paths and environment variables
- Maintain all existing functionality from the original batch files

### Key Features to Implement

1. **Both Scripts:**
   - Date/time formatting and directory creation
   - Path handling for Godot projects, exports, and mods
   - Process execution for Godot CLI commands
   - Error handling and logging

2. **build_one_mod.py:**
   - Single mod building capability
   - Previous build detection and copying
   - Mod order template handling
   - Game execution after successful build

3. **build.py:**
   - Multiple mod building capability
   - Fresh build directory creation
   - Mod order template handling
   - Game execution after successful build

4. **build_utils.py:**
   - Common functions for both scripts
   - Path handling utilities
   - Date/time formatting
   - Godot process execution
   - Directory management

## Tasks (Aka Prompts)

1. Implement build_utils.py module
```
- Implement shared functionality in scripts/python/build_utils.py:
  - Format current date and time
  - Handle paths for Godot, projects, exports
  - Execute Godot commands
  - Create build directories
  - Check for successful builds
  - Copy files between builds
  - Run the game after building
- Add proper inline script metadata for dependencies
- Include comprehensive docstrings and comments
```

2. Convert build_one_mod.bat to Python
```
- Create build_one_mod.py in the scripts/python directory
- Import and use functions from build_utils.py
- Implement command-line argument parsing
- Handle building a single mod
- Check for previous builds and copy files if needed
- Create mod order template if needed
- Export the mod project
- Run the game if export was successful
- Add proper inline script metadata for dependencies
- Include comprehensive docstrings and comments
```

3. Convert build.bat to Python
```
- Create build.py in the scripts/python directory
- Import and use functions from build_utils.py
- Implement building all mods (main_menu, settings_menu, isometric_2d_prototype)
- Create fresh build directories
- Copy mod order template
- Export all projects
- Run the game if exports were successful
- Add proper inline script metadata for dependencies
- Include comprehensive docstrings and comments
```

4. Create minimal wrapper batch files
```
- Update the existing build_one_mod.bat and build.bat files to be minimal wrappers
- These should simply call uv run on the corresponding Python scripts in the python directory
- Pass any command-line arguments through to the Python scripts
- Handle any necessary environment setup
- Example wrapper format:
  @echo off
  uv run %~dp0\python\build.py %*
```

5. Test the implementations
```
- Test build_one_mod.py with different mod names:
  - Command: uv run c:\GithubRepos\GMF-Isometric-2D-Starter\scripts\python\build_one_mod.py main_menu
  - Command: uv run c:\GithubRepos\GMF-Isometric-2D-Starter\scripts\python\build_one_mod.py settings_menu
  - Command: uv run c:\GithubRepos\GMF-Isometric-2D-Starter\scripts\python\build_one_mod.py isometric_2d_prototype
- Test build.py for building all mods:
  - Command: uv run c:\GithubRepos\GMF-Isometric-2D-Starter\scripts\python\build.py
- Test the minimal wrapper batch files:
  - Command: c:\GithubRepos\GMF-Isometric-2D-Starter\scripts\build_one_mod.bat main_menu
  - Command: c:\GithubRepos\GMF-Isometric-2D-Starter\scripts\build.bat
- Verify that the functionality matches the original batch files
- Check that the game runs correctly after building
- Validate directory structure and file creation in the build folder
```

## Additional Notes

- The Python scripts should use subprocess.run() for executing commands
- Use os.path and pathlib for path manipulation
- Use ArgumentParser for command-line argument parsing
- Follow PEP 8 style guidelines
- Add proper error handling with try/except blocks
- Include logging for debugging and user feedback
- Make the code modular and reusable
- Include inline comments explaining complex operations
- Make sure all paths work correctly on Windows
