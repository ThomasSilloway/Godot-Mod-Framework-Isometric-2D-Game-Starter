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

 - folder: ai_docs/GUT_unit_testing
 - file: ai_docs/godot/astar2d.md

## Related files
 - Project Directory: projects\isometric_2d_prototype
 - Core Navigation: projects/isometric_2d_prototype/isometric_2d_prototype/navigation/a_star_2d_navigation.gd
 - Debug Visualization: projects/isometric_2d_prototype/isometric_2d_prototype/debug/world_debug_draw.gd

## Project Details
 - Use only Godot 4.4 syntax
 - The tile size is 256x128, using isometric tiles, Diamond Down layout
 - Don't try to open the godot editor to test or verify or for any reason
 - Add integration tests to: projects/isometric_2d_prototype/tests/integration
 - When fixing any bugs or reviewing code, make a list of 3 possible solutions, evaluate them and implement the best one. Record your notes about these options in a new file inside the current directory of this spec file under the folder: generated
  - Naming convention: Bug_01_Bug_Description.md
  - Note the bug description in the filename should be 5 words or less

## Communication Flow
- a_star_2d_navigation.gd will emit the following signals:
  - path_calculated(path: PackedVector2Array)
  - pathfinding_progress_updated(info: Dictionary)  # Contains current state like visited nodes, current position, etc.
- world_debug_draw.gd will listen to these signals and handle visualization


