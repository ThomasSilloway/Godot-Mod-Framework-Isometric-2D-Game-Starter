# 2d isometric game built with godot 4.4

## High Level Overview
   Update a_star_2d_navigation.gd to respect colliders like walls. For example if there's a wall between 0,0 and 0,-1 those two cells should not be connected and the player should not try to run directly there, it should run around the wall

   This functionality is already implemented. We need to add new unit test to verify the walls are being created correctly.

## Docs

 - folder: ai_docs/GUT_unit_testing
 - file: ai_docs/godot/astar2d.md

## Related files
 - Project Directory: projects\isometric_2d_prototype
 - file: projects/isometric_2d_prototype/isometric_2d_prototype/navigation/a_star_2d_navigation.gd
 - file: projects\isometric_2d_prototype\isometric_2d_prototype\test_navigation_collision_scene.tscn
  - #file:projects/isometric_2d_prototype/isometric_2d_prototype/navigation/wall_collision_detector.gd 
  - #file:projects\isometric_2d_prototype\tests\unit\test_wall_creation.gd (new file)

## Project Details
 - Use only Godot 4.4 syntax
 - The tile size is 256x128, using isometric tiles, Diamond Down layout
 - Don't try to open the godot editor to test or verify or for any reason
 - Add integration tests to: projects/isometric_2d_prototype/tests/integration
 - Add unit tests to: projects/isometric_2d_prototype/unit/integration
 - Typically node references are implemented incorrectly in the tasks below, here's some notes to help:
   - Use Godot's unique name referencing system to ensure proper node references
   - Avoid using direct node paths, instead use `get_node()` with unique names using the % operator
   - Double check the node exists in the related .tscn before using it, if it doesn't then create it in the .tscn file
   - Example: `_debug_draw = get_node("%World-Draw-Debug")`
 - IMPORTANT: Make sure existing functionality in the files is not broken, please refer to the feature list to confirm
  - Ensure each file that is touched has an empty line at the end of the file

## Tasks

### Implement File Structure
- projects/isometric_2d_prototype/isometric_2d_prototype    
  - tests/unit/test_wall_creation.gd
    - Load test_navigation_collision_scene.tscn and test wall creation. 
    - In the scene, the player is located at world position 0,0. There are 3 walls on the upper right edges of 0,0, 1,0, 2,0 and 3 walls on the upper left edges of 0,-1, 0,-2, 0,-3. 

### Double check your implementation
```
 - Make sure the High Level Overview was implemented correctly
 - Append the notes of your review to change_notes.md
 - Confirm that no features were removed or broken by consulting `feature_list.md`
```
### Bug Fixing
```
- Make a list of 3 possible solutions, evaluate them and implement the best one. Record your notes about these options in a new file inside the current directory of this spec file under the folder: generated
- Naming convention: Bug_<number>_<Bug_Description>.md
- Note the bug description in the filename should be 5 words or less
- Example: Bug_01_Signal_Connection_API_Incompatibility.md
- Make sure to increment the number for each new bug (check the folder first to see the next number)
```

### Verification
```
- Don't try to open the godot editor to test or verify or for any reason
- Run integration tests to verify the implementation via commandline:
  - Note: The command will be run in a powershell terminal, so don't use && to join terminal commands
  - cd c:\GithubRepos\GMF-Isometric-2D-Starter; .\scripts\run_tests.bat tests/integration/test_non_grid_navigation.gd
  - Example: cd c:\GithubRepos\GMF-Isometric-2D-Starter; .\scripts\run_tests.bat tests/integration/test_non_grid_navigation.gd
- If there are errors, repeat ### Bug Fixing step above
```
