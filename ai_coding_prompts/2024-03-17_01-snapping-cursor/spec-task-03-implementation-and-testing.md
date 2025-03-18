# 2d isometric game built with godot 4.4

## High Level Overview
Implement cursor snapping functionality for the isometric 2D prototype. This will allow the Cursor node to automatically snap to the nearest tile grid position as the mouse is moved around the scene. The implementation will use the newly created util_grid.gd class for coordinate conversions.

## Docs
 - folder: ai_docs/GUT_unit_testing
 - projects/isometric_2d_prototype/feature_list.md

## Related files
 - Project Directory: projects\isometric_2d_prototype
 - file: projects\isometric_2d_prototype\feature_list.md
 - file: projects\isometric_2d_prototype\navigation\util_grid.gd
 - file: projects\isometric_2d_prototype\test_navigation_collision_scene.tscn
 - Example unit test: projects\isometric_2d_prototype\tests\unit\test_wall_creation.gd

## Project Details
 - Use only Godot 4.4 syntax
 - The tile size is 256x128, using isometric tiles, Diamond Down layout
 - Add integration tests to: projects/isometric_2d_prototype/tests/integration
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

### Integration Test
 - Write a test in a new file in the projects\isometric_2d_prototype\tests\integration folder called: test_cursor_snap.gd
 - The test should not pass initially because the implementation is not done yet
 - Test should verify that:
   1. The cursor properly snaps to the nearest tile grid position
   2. The conversion functions correctly handle both positive and negative coordinates
   3. The cursor position is updated accurately when the mouse moves
   4. The cursor correctly handles edge cases such as map boundaries

### Implement File Structure

#### cursor/cursor.gd
- Create a new script for the Cursor node to handle snapping functionality
- Implement _process method to capture mouse movement
- Reference the util_grid.gd for coordinate conversions
- Handle instant snapping of the cursor to tile centers
- Implement boundary checking for map edges
- Support snapping for all areas of the tilemap
- Add proper error handling and comments

#### test_navigation_collision_scene.tscn (Update)
- Attach the cursor.gd script to the existing Cursor node
- Ensure proper references between nodes

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
  - cd c:\GithubRepos\GMF-Isometric-2D-Starter; .\scripts\run_tests.bat tests/integration/test_cursor_snap.gd
- If there are errors, repeat ### Bug Fixing step above
```
