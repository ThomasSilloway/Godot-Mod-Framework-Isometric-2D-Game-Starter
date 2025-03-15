# 2d isometric game built with godot 4.4

## High Level Overview
   Update a_star_2d_navigation.gd to respect colliders like walls. For example if there's a wall between 0,0 and 0,-1 those two cells should not be connected and the player should not try to run directly there, it should run around the wall

   This is already implemented, we are now on bug fixing.

## Current Bug Details
   The tile coordinates are off by 1! The character is actually on tilemap square -1,0 not 0,0. This has been confirmed for all tilemap positions.

   Clarifications:
   1. Character's true position: At world position 0,0 but grid position -1,0
   2. Solution approach: Update tests to use correct starting position (-1,0)
   3. Tilemap coordinate system: All tilemaps are aligned correctly, showing same offset
   4. Issue scope: Present throughout the entire coordinate system
   5. Debug visualization: Should be adjusted to show true grid positions

## Docs

 - none

## Related files
 - Project Directory: projects\isometric_2d_prototype
 - file: projects/isometric_2d_prototype/isometric_2d_prototype/navigation/a_star_2d_navigation.gd
 - file: projects\isometric_2d_prototype\isometric_2d_prototype\test_navigation_collision_scene.tscn
 - file: projects\isometric_2d_prototype\isometric_2d_prototype\debug\world_debug_draw.gd
 - file: projects\isometric_2d_prototype\isometric_2d_prototype\navigation\wall_collision_detector.gd 
 - file: projects\isometric_2d_prototype\tests\unit\test_wall_creation.gd 

## Project Details
 - Use only Godot 4.4 syntax
 - The tile size is 256x128, using isometric tiles, Diamond Down layout
 - Don't try to open the godot editor to test or verify or for any reason
 - Add integration tests to: projects/isometric_2d_prototype/tests/integration
 - Typically node references are implemented incorrectly in the tasks below, here's some notes to help:
   - Use Godot's unique name referencing system to ensure proper node references
   - Avoid using direct node paths, instead use `get_node()` with unique names using the % operator
   - Double check the node exists in the related scene before using it, if it doesn't then create it
   - Example: `_debug_draw = get_node("%World-Draw-Debug")`
 - IMPORTANT: Make sure existing functionality in the files is not broken, please refer to the feature list to confirm
 - Ensure each file that is touched has an empty line at the end of the file
 - Use tabs for indentation instead of spaces, it will break otherwise

### Current Implement File Structure
- projects/isometric_2d_prototype/isometric_2d_prototype
  - navigation/wall_collision_detector.gd
    - A new class that handles figuring out which nodes are connected to which
    - Basic wall detection logic using the TileMapLayer nodes:
      - TileMapLayer-Walls-East: bottom right wall
      - TileMapLayer-Walls-West: top left wall
      - TileMapLayer-Walls-North: top right wall
      - TileMapLayer-Walls-South: bottom left wall
    - Core functionality:
      - Check if a wall exists between two points
      - Cache wall information during initialization
      - Basic error handling for invalid wall configurations
    
  - navigation/a_star_2d_navigation.gd 
    - Update setup_grid to handle collision from walls using wall_collision_detector.gd
    - Core changes:
      - Initialize wall_collision_detector
      - Use wall checks when connecting points
      - Validate wall configurations during setup
    
  - debug/world_debug_draw.gd
    - Add wall visualization features:
      - Draw walls between grid points
      - Show blocked connections
      - Toggle wall visibility
      - Visual debugging for wall detection
    
  - tests/integration/test_wall_navigation.gd
    - Load test_navigation_collision_scene.tscn and test pathfinding around walls. In the scene, the player is located at world position 0,0. There are 3 walls on the upper right edges of 0,0, 1,0, 2,0 and 3 walls on the upper left edges of 0,-1, 0,-2, 0,-3. Write a test that tries to move the player from cell 0,0 to cell 0,-1. Make sure they move around all of the 3 walls and don't get stuck.
    - Only testing the specified coordinates (0,0 to 0,-1) is required

  - tests/unit/test_wall_creation.gd
   - See file for details

## Tasks

### Bug Fixing
```
- Please make targetted changes and do not delete large blocks of code that you think is unused like logging
- Make a list of 3 possible solutions, evaluate them and implement the best one. Record your notes about these options in a new file inside the current directory of this spec file under the folder: generated
- Naming convention: Bug_<number>_<Bug_Description>.md
- Note the bug description in the filename should be 5 words or less
- Example: Bug_01_Signal_Connection_API_Incompatibility.md
- Make sure to increment the number for each new bug (check the folder first to see the next number)
```

### Update change_notes.md file
 - For each set of changes you implement, add a new section with:
  - ## Version title Ex: v01 Initial implementation
    - A brief description of the changes made
    - Details of what was implemented/fixed
 - Always append new changes as a new section at the bottom of the file, keeping the previous change notes intact

### Verification
```
- Don't try to open the godot editor to test or verify or for any reason
- Run integration tests to verify the implementation via commandline:
  - Note: The command will be run in a powershell terminal, so don't use && to join terminal commands
  - cd c:\GithubRepos\GMF-Isometric-2D-Starter; .\scripts\run_tests.bat tests/unit/test_wall_creation.gd
- If there are errors, repeat ### Bug Fixing step above
```
