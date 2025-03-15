# 2d isometric game built with godot 4.4

## High Level Overview
Fix the coordinate system discrepancy where:
1. The player at world position (0,0) maps to grid position (-1,0), which is the correct behavior but was incorrectly documented as (0,0)
2. The TileMapLayer and AStar grid coordinate systems need to be aligned to ensure consistent behavior
3. World debug visualization needs to show both coordinate systems correctly

## Docs

## Related files
 - Example unit test: projects\isometric_2d_prototype\tests\unit\test_wall_creation.gd
- Project Directory: projects\isometric_2d_prototype
- file: projects/isometric_2d_prototype/feature_list.md
- file: projects/isometric_2d_prototype/isometric_2d_prototype/navigation/a_star_2d_navigation.gd
- file: projects/isometric_2d_prototype/isometric_2d_prototype/debug/world_debug_draw.gd
- file: projects/isometric_2d_prototype/isometric_2d_prototype/test_navigation_collision_scene.tscn

## Project Details
 - Use only Godot 4.4 syntax
 - The tile size is 256x128, using isometric tiles, Diamond Down layout
 - Add integration tests to: projects/isometric_2d_prototype/tests/integration
 - Add unit tests to: projects/isometric_2d_prototype/unit/integration
 - Typically node references are implemented incorrectly in the tasks below, here's some notes to help:
   - Use Godot's unique name referencing system to ensure proper node references
   - Avoid using direct node paths, instead use `get_node()` with unique names using the % operator
   - Double check the node exists in the related scene before using it, if it doesn't then create it
   - Example: `_debug_draw = get_node("%World-Draw-Debug")`
  - IMPORTANT: Make sure existing functionality in the files is not broken, please refer to the feature list to confirm
  - Ensure each file that is touched has an empty line at the end of the file
  - Use tabs for indentation instead of spaces, it will break otherwise

## Tasks

### Update change_notes.md file
 - If change_notes.md file doesn't exist, create it inside the current directory of this spec file under the folder: generated
 - For each set of changes you implement, add a new section with:
  - ## Version title Ex: v01
    - A brief description of the changes made
    - Details of what was implemented/fixed
 - Always append new changes as a new section at the bottom of the file, keeping the previous change notes intact

### Unit Test
- Write a test in the projects\isometric_2d_prototype\tests\unit folder called: test_coordinate_system.gd
- The test should verify:
  1. World position (0,0) maps to grid position (-1,0) in both TileMapLayer and AStar systems (this is correct behavior)
  2. All grid coordinates are consistent between TileMapLayer.local_to_map() and _world_to_grid()
- Use test_navigation_collision_scene.tscn for setup
- Use the existing character in the scene for position testing

### Implement Fixes
- projects/isometric_2d_prototype/isometric_2d_prototype/navigation/a_star_2d_navigation.gd:
  - Verify that _world_to_grid matches TileMapLayer.local_to_map behavior
  - Ensure _grid_to_world matches TileMapLayer.map_to_local behavior
  - Add debug validation comparing both coordinate systems
  - Note: (0,0) world position correctly maps to (-1,0) grid position

- projects/isometric_2d_prototype/isometric_2d_prototype/debug/world_debug_draw.gd:
  - Update visualization to show both TileMapLayer and AStar grid positions
  - Add toggle functionality to switch between coordinate system views
  - Ensure the player position shows the correct grid coordinate (-1,0) when at world (0,0)
  - Use different colors or styles to clearly distinguish between the coordinate systems when toggling

### Double check your implementation
```
 - Make sure the High Level Overview was implemented correctly
 - Append the notes of your review to change_notes.md
 - Confirm that no features were removed or broken by consulting `feature_list.md`
 - Ensure each file that was touched has an empty line at the end of the file
```

### Bug Fixing
```
- Please make targetted changes and do not delete large blocks of code that you think is unused like logging
- Make a list of 3 possible solutions, evaluate them and implement the best one. Record your notes about these options in a new file inside the current directory of this spec file under the folder: generated
- Naming convention: Bug_<number>_<Bug_Description>.md
- Note the bug description in the filename should be 5 words or less
- Example: Bug_01_Signal_Connection_API_Incompatibility.md
- Make sure to increment the number for each new bug (check the folder first to see the next number)
```

### Verification
```
- Don't try to open the godot editor to test or verify or for any reason
- Run integration or unit tests to verify the implementation via commandline:
  - Note: The command will be run in a powershell terminal, so don't use && to join terminal commands
  - cd c:\GithubRepos\GMF-Isometric-2D-Starter; .\scripts\run_tests.bat tests/unit/test_coordinate_system.gd
- If there are errors, repeat ### Bug Fixing step above
```
