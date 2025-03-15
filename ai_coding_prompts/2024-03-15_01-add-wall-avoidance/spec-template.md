# 2d isometric game built with godot 4.4

## High Level Overview
 <insert_high_level_overview>

## Docs

 - folder: ai_docs/GUT_unit_testing
 <insert_more_docs>

## Related files
 - Project Directory: projects\isometric_2d_prototype
 - file: projects\isometric_2d_prototype\feature_list.md
 <insert_related_files>

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

### Integration Test
 - Write a test in a new file in the projects\isometric_2d_prototype\tests\integration folder called: <insert_test_name>.gd
 - The test should not pass initially because the implementation is not done yet
 - <insert_test_description>

### Implement File Structure
<insert_file_structure_with_implementation_details_for_each_file> 

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
  - cd c:\GithubRepos\GMF-Isometric-2D-Starter; .\scripts\run_tests.bat tests/integration/test_non_grid_navigation.gd
  - Example: cd c:\GithubRepos\GMF-Isometric-2D-Starter; .\scripts\run_tests.bat tests/integration/test_non_grid_navigation.gd
- If there are errors, repeat ### Bug Fixing step above
```
