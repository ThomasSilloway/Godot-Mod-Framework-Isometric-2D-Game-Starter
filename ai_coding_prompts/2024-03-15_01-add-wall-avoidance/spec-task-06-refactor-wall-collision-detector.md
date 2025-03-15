# 2d isometric game built with godot 4.4

## High Level Overview
  Update a_star_2d_navigation.gd to respect colliders like walls. For example if there's a wall between 0,0 and 0,-1 those two cells should not be connected and the player should not try to run directly there, it should run around the wall

   This is already implemented, but we've run into a bunch of bugs that need to be fixed. Refactoring the wall_collision_detector.gd file to make it easier to test and fix the bugs is necessary.

   Proposal:
    - Instead of checking for walls between each node from `a_star_2d_navigation.gd`, we will check for walls between each node in the `wall_collision_detector.gd` file and cache them at startup in the ready function/
    - We should be able to print a debug message to show the walls that are being detected example:
    ```
      - Walls detected:
        - 0,0 -> 1,0
        - 0,0 -> 0,-1
        - 1,0 -> 2,0
        - 2,0 -> 3,0
        - 3,0 -> 4,0
        - 4,0 -> 5,0
        - 5,0 -> 6,0
        - 6,0 -> 7,0
        - 7,0 -> 8,0
    ```
    - then `a_star_2d_navigation.gd` will simply ask the `wall_collision_detector.gd` if there is a wall between two nodes and it will return true or false.
    - Make sure to not remove any of the key features in the `feature_list.md` file, just add the new features to the `wall_collision_detector.gd` file and update the `a_star_2d_navigation.gd` file to use the new features and remove duplicate code that was just added to `wall_collision_detector.gd` file.
     

## Docs

 - file: ai_docs/godot/astar2d.md

## Related files
 - Project Directory: projects\isometric_2d_prototype
 - file: projects\isometric_2d_prototype\feature_list.md

- file: ai_coding_prompts\2024-03-15_01-add-wall-avoidance\generated\change_notes.md

 - file: projects/isometric_2d_prototype/isometric_2d_prototype/navigation/a_star_2d_navigation.gd
 - #file:projects/isometric_2d_prototype/isometric_2d_prototype/navigation/wall_collision_detector.gd 
 - file: projects\isometric_2d_prototype\isometric_2d_prototype\debug\world_debug_draw.gd
 - file: projects\isometric_2d_prototype\isometric_2d_prototype\test_navigation_collision_scene.tscn
 - #file:projects\isometric_2d_prototype\tests\unit\test_wall_creation.gd 

## Project Details
 - Use only Godot 4.4 syntax
 - The tile size is 256x128, using isometric tiles, Diamond Down layout
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
 - For each set of changes you implement, add a new section with:
  - ## Version title Ex: v01
    - A brief description of the changes made
    - Details of what was implemented/fixed
 - Always append new changes as a new section at the bottom of the file, keeping the previous change notes intact

### Implement File Structure
- projects/isometric_2d_prototype/isometric_2d_prototype
  - navigation/wall_collision_detector.gd
    - Handles figuring out which nodes have walls between them
    - Basic wall detection logic using the TileMapLayer nodes:
      - TileMapLayer-Walls-East: bottom right wall
      - TileMapLayer-Walls-West: top left wall
      - TileMapLayer-Walls-North: top right wall
      - TileMapLayer-Walls-South: bottom left wall
    - Core functionality:
      - Check if a wall exists between two points
      - Cache wall information during initialization
      - Debug logging to show detected walls
    
  - navigation/a_star_2d_navigation.gd 
    - Setup_grid handles collision from walls using wall_collision_detector.gd
    - Core changes:
      - Initialize wall_collision_detector
      - Use wall checks when connecting points

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
- Run integration tests to verify the implementation via commandline:
  - Note: The command will be run in a powershell terminal, so don't use && to join terminal commands
  - cd c:\GithubRepos\GMF-Isometric-2D-Starter; .\scripts\run_tests.bat tests/unit/test_wall_creation.gd
- If there are errors, repeat ### Bug Fixing step above
```
