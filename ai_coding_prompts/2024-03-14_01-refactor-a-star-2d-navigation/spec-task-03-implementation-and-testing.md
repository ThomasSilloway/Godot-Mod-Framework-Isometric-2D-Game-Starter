# 2d isometric game built with godot 4.4

## High Level Overview
Split the A* 2D navigation code using a composition-based approach into the following structure:

Core Navigation:
- a_star_2d_navigation.gd: Handles core A* pathfinding logic, grid/world coordinate conversion, and path calculation
- Emits signals for path results and pathfinding state changes, but contains no visualization logic

Debug Visualization:
- world_debug_draw.gd: Handles all debug visualization features including path visualization, grid coordinate display, and debug logging

The goal is to improve code organization and maintainability while maintaining loose coupling between components.

## Docs

 - file: ai_docs/godot/astar2d.md

## Related files
 - Core Navigation: projects/isometric_2d_prototype/isometric_2d_prototype/navigation/a_star_2d_navigation.gd
 - Debug Visualization: projects/isometric_2d_prototype/isometric_2d_prototype/debug/world_debug_draw.gd

## Project Details
 - Use only Godot 4.4 syntax
 - The tile size is 256x128, using isometric tiles, Diamond Down layout

## Tasks

### Update change_notes.md file
 - If change_notes.md file doesn't exist, create it inside the current directory of this spec file under the folder: generated
 - For each set of changes you implement, add a new section with:
  - ## Version title Ex: v01 First pass changes
    - A brief description of the changes made
    - Details of what was implemented/fixed
 - Always append new changes as a new section at the bottom of the file, keeping the previous change notes intact

 ### Implement File Structure
 #### Core Navigation Files
- projects/isometric_2d_prototype/isometric_2d_prototype/navigation/
  - a_star_2d_navigation.gd
    - Core A* pathfinding logic
    - Grid/world coordinate conversion
    - Path calculation
    - Pathfinding state tracking and signals
    - No debug-related drawing or visualization
    - Yes debug logging

#### Debug System
- projects/isometric_2d_prototype/isometric_2d_prototype/debug/
  - world_debug_draw.gd
    - All debug visualization features
    - Path visualization
    - Grid coordinate display
    - Connection visualization
    - Click position tracking
    - Debug controls

#### Communication Flow
- a_star_2d_navigation.gd emits signals for:
  - path_calculated(path: PackedVector2Array)
  - pathfinding_progress_updated(info: Dictionary)  # Contains state like visited nodes, current position
- world_debug_draw.gd listens and visualizes

The core navigation system remains agnostic to how its information is used, while providing meaningful state updates that can be used for debugging, UI feedback, or other purposes.

### Double check your implementation
```
 - Make sure the High Level Overview was implemented correctly
 - Append the notes of your review to change_notes.md
```

### Verification Notes for next task
 - Don't try to open the godot editor to test or verify or for any reason
 - Assume the commands are being run in a powershell termina, so don't use && to join terminal commands
 - When fixing any bugs or reviewing code, make a list of 3 possible solutions, evaluate them and implement the best one. Record your notes about these options in a new file inside the current directory of this spec file under the folder: generated
  - Naming convention: Bug_<number>_<Bug_Description>.md
  - Note the bug description in the filename should be 5 words or less
  - Example: Bug_01_Signal_Connection_API_Incompatibility.md
  
### Verification

```
Run integration tests to verify the implementation via commandline:
 - cd c:\GithubRepos\GMF-Isometric-2D-Starter; .\scripts\run_tests.bat tests/integration/test_non_grid_navigation.gd
- There are no errors
- The log messages are as expected
```
