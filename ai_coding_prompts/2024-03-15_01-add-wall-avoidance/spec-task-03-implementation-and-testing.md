# 2d isometric game built with godot 4.4

## High Level Overview
   Update a_star_2d_navigation.gd to respect colliders like walls. For example if there's a wall between 0,0 and 0,-1 those two cells should not be connected and the player should not try to run directly there, it should run around the wall

## Docs

 - folder: ai_docs/GUT_unit_testing
 - file: ai_docs/godot/astar2d.md

## Related files
 - Project Directory: projects\isometric_2d_prototype
 - file: projects/isometric_2d_prototype/isometric_2d_prototype/navigation/a_star_2d_navigation.gd
 - file: projects\isometric_2d_prototype\isometric_2d_prototype\test_navigation_collision_scene.tscn
 - file: projects\isometric_2d_prototype\tests\integration\test_non_grid_navigation.gd
 - file: projects\isometric_2d_prototype\isometric_2d_prototype\debug\world_debug_draw.gd
  - #file:projects/isometric_2d_prototype/isometric_2d_prototype/navigation/wall_collision_detector.gd 
  - #file:projects\isometric_2d_prototype\tests\integration\test_wall_navigation.gd 

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

## Tasks

### Update change_notes.md file
 - If change_notes.md file doesn't exist, create it inside the current directory of this spec file under the folder: generated
 - For each set of changes you implement, add a new section with:
  - ## Version title Ex: v01
    - A brief description of the changes made
    - Details of what was implemented/fixed
 - Always append new changes as a new section at the bottom of the file, keeping the previous change notes intact

### Implement File Structure
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
    - The test should not pass initially because the implementation is not done yet
    - Load test_navigation_collision_scene.tscn and test pathfinding around walls. In the scene, the player is located at world position 0,0. There are 3 walls on the upper right edges of 0,0, 1,0, 2,0 and 3 walls on the upper left edges of 0,-1, 0,-2, 0,-3. Write a test that tries to move the player from cell 0,0 to cell 0,-1. Make sure they move around all of the 3 walls and don't get stuck.
    - Only testing the specified coordinates (0,0 to 0,-1) is required

### Double check your implementation
```
 - Make sure the High Level Overview was implemented correctly
 - Append the notes of your review to change_notes.md
 - Confirm that no features were removed or broken by consulting `feature_list.md`
```
### Verification
```
Run integration tests to verify the implementation via commandline:
 - Note: The command will be run in a powershell terminal, so don't use && to join terminal commands
 - cd c:\GithubRepos\GMF-Isometric-2D-Starter; .\scripts\run_tests.bat tests/integration/test_non_grid_navigation.gd
 - Example: cd c:\GithubRepos\GMF-Isometric-2D-Starter; .\scripts\run_tests.bat tests/integration/test_non_grid_navigation.gd
- There are no errors
- The log messages are as expected
- Don't try to open the godot editor to test or verify or for any reason
- When fixing any bugs or reviewing code, make a list of 3 possible solutions, evaluate them and implement the best one. Record your notes about these options in a new file inside the current directory of this spec file under the folder: generated
- Naming convention: Bug_<number>_<Bug_Description>.md
- Note the bug description in the filename should be 5 words or less
- Example: Bug_01_Signal_Connection_API_Incompatibility.md
- Make sure to increment the number for each new bug
```
