# 2d isometric game built with godot 4.4

## High Level Overview
 <insert_high_level_overview>

## Docs

 - folder: ai_docs/GUT_unit_testing
 <insert_more_docs>

## Related files
 - Project Directory: projects\isometric_2d_prototype
 - isometric_2d_prototype\test_navigation_scene.md
 <insert_more_docs>

## Project Details
 - Use only Godot 4.4 syntax
 - The tile size is 256x128, using isometric tiles, Diamond Down layout
 - Don't try to open the godot editor to test or verify or for any reason
 - Add integration tests to: projects/isometric_2d_prototype/tests/integration
 - When fixing any bugs or reviewing code, make a list of 3 possible solutions, evaluate them and implement the best one. Record your notes about these options in a new file inside the current directory of this spec file under the folder: generated
  - Naming convention: Bug_01_Bug_Description.md
  - Note the bug description in the filename should be 5 words or less

## Tasks

### Add change_notes.md file
 - Create change_notes.md file inside the current directory of this spec file under the folder: generated
 - Add the notes from the each change you implement below

### Create a detailed architecture document
 - Add this to the current directory of this spec file under the folder: generated

### Double check your architecture document
 - Pretend to be an coding architect reviewer and review the document and make any changes if necessary
 - Make sure to question high level and detailed design decisions

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
```

### Verification
```
Run integration tests to verify the implementation via commandline:
 - godot --headless --script res://addons/gut/gut_cmdln.gd -d -gselect="<path_to_test_script>" -gexit
 - Example: godot --headless --script res://addons/gut/gut_cmdln.gd -d -gselect="res://tests/integration/01.gd" -gexit
- There are no errors
- The log messages are as expected
```