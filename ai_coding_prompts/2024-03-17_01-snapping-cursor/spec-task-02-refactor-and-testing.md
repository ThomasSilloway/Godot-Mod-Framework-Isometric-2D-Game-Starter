# 2d isometric game built with godot 4.4

## High Level Overview
Refactor coordinate conversion functionality from the navigation system into a reusable utility class. This will centralize all grid-related coordinate conversions in a single location, making these functions available to both the navigation system and the upcoming cursor snapping feature.

## Docs
 - folder: ai_docs/GUT_unit_testing
 - projects/isometric_2d_prototype/feature_list.md

## Related files
 - Project Directory: projects\isometric_2d_prototype
 - file: projects\isometric_2d_prototype\feature_list.md
 - file: projects\isometric_2d_prototype\navigation\a_star_2d_navigation.gd
 - file: projects\isometric_2d_prototype\tests\unit\test_coordinate_system.gd
 - file: projects\isometric_2d_prototype\tests\unit\test_wall_creation.gd
 - file: projects\isometric_2d_prototype\tests\integration\test_wall_navigation.gd

## Project Details
 - Use only Godot 4.4 syntax
 - The tile size is 256x128, using isometric tiles, Diamond Down layout
 - Add unit tests to: projects/isometric_2d_prototype/tests/unit
 - Typically node references are implemented incorrectly in the tasks below, here's some notes to help:
   - Use Godot's unique name referencing system to ensure proper node references
   - Avoid using direct node paths, instead use `get_node()` with unique names using the % operator
   - Double check the node exists in the related scene before using it, if it doesn't then create it
   - Example: `_debug_draw = get_node("%World-Draw-Debug")`
  - IMPORTANT: Make sure existing functionality in the files is not broken, please refer to the feature list to confirm
  - Ensure each file that is touched has an empty line at the end of the file
  - Use tabs for indentation instead of spaces, it will break otherwise

## Implementation Notes
- The utility class should use the default 256x128 tile size
- Test files should be updated to use the new utility class directly
- The utility functions should reference the TileMapLayer-Ground node directly for conversions
- Functions should NOT be static, but instead should use direct references to the ground layer
- In a_star_2d_navigation.gd, replace the existing functions with direct calls to the utility class
- The primary goal is separation of concerns, making coordinate conversion functionality more reusable

## Tasks

### Unit Test
 - Write a test in a new file in the projects\isometric_2d_prototype\tests\unit folder called: test_util_grid.gd
 - projects\isometric_2d_prototype\tests\unit\test_wall_creation.gd is a good example
 - The test should verify that:
   1. The coordinate conversion functions work correctly for both positive and negative coordinates
   2. The extracted utility class maintains the same functionality as the original functions
   3. World to grid and grid to world conversions are consistent and accurate
 - Note that this test complements the existing test_coordinate_system.gd, which will still be used

### Update change_notes.md file
 - If change_notes.md file doesn't exist, create it inside the current directory of this spec file under the folder: generated
 - For each set of changes you implement, add a new section with:
  - ## Version title Ex: v01
    - A brief description of the changes made
    - Details of what was implemented/fixed
 - Always append new changes as a new section at the bottom of the file, keeping the previous change notes intact

### Update Existing Tests
 - Update test_coordinate_system.gd to continue working after the refactoring
 - Update test_wall_creation.gd to use the new utility class
 - Update test_wall_navigation.gd to use the new utility class
 - Ensure all tests still pass with the refactored navigation system
 - Avoid changing the tests' core logic or assertions if possible
 - If changes are needed, document them in the change notes

### Implement File Structure

#### navigation/util_grid.gd
- Create a new utility class to centralize coordinate conversion functions
- Extract the following functions from a_star_2d_navigation.gd:
  - _world_to_grid: Convert world coordinates to grid coordinates
  - _grid_to_world: Convert grid coordinates to world coordinates
  - get_tile_center: Get the center position of a tile
  - get_closest_valid_grid_position: Find valid grid positions
- Include proper error handling and validation
- Add static typing for all function parameters and return values
- Document each function with clear comments
- Create a class_name for easy referencing
- The class should directly reference the TileMapLayer-Ground node for conversions
- Use the default 256x128 tile size
- Do NOT make the functions static

#### a_star_2d_navigation.gd (Update)
- Update to use the new util_grid.gd for coordinate conversions
- Replace direct function calls with references to the utility class
- Ensure all existing functionality continues to work
- Update any references to the refactored functions
- For the refactored functions that need to be maintained for compatibility, implement them to call the utility class

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
- Run unit tests to verify the implementation via commandline:
  - Note: The command will be run in a powershell terminal, so don't use && to join terminal commands
  - cd c:\GithubRepos\GMF-Isometric-2D-Starter; .\scripts\run_tests.bat tests/unit/test_util_grid.gd
  - cd c:\GithubRepos\GMF-Isometric-2D-Starter; .\scripts\run_tests.bat tests/unit/test_coordinate_system.gd
  - cd c:\GithubRepos\GMF-Isometric-2D-Starter; .\scripts\run_tests.bat tests/unit/test_wall_creation.gd
  - cd c:\GithubRepos\GMF-Isometric-2D-Starter; .\scripts\run_tests.bat tests/integration/test_wall_navigation.gd
- If there are errors, repeat ### Bug Fixing step above
```
