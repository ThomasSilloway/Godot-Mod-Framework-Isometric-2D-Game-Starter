# 2d isometric game built with godot 4.4

## High Level Overview
This project currently uses `AStarGrid2D` for path finding and moving the character around with clicking. We need to create an alternate version that uses `AStar2D` instead. It should have all of the same functionality.

For right now, it should ignore collision and automatically add edges from each node to each other node, we'll add collision handling in a later feature.

Use the same interface for this new navigation system that `isometric_navigation.gd` uses so that `character_controller_point_and_click.gd` can call it the same way.

## Docs

 - folder: ai_docs/GUT_unit_testing
 - ai_docs/godot/astar2d.md

## Related files
 - Project Directory: projects\isometric_2d_prototype
 - isometric_2d_prototype\test_navigation_scene.md
 - isometric_2d_prototype/navigation/isometric_navigation.gd
 - isometric_2d_prototype/character_controller/character_controller_point_and_click.gd
 - isometric_2d_prototype/debug/world_debug_draw.gd

## Project Details
 - Use only Godot 4.4 syntax
 - The tile size is 256x128, using isometric tiles, Diamond Down layout
 - Don't try to open the godot editor to test or verify or for any reason
 - Add integration tests to: projects/isometric_2d_prototype/tests/integration
 - When fixing any bugs or reviewing code, make a list of 3 possible solutions, evaluate them and implement the best one. Record your notes about these options in a new file inside the current directory of this spec file under the folder: generated
  - Naming convention: Bug_01_Bug_Description.md
  - Note the bug description in the filename should be 5 words or less
 - Make sure there is an empty line at the end of each file you create or modify

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
 - Write a test in a new file in the integration tests folder called: test_non_grid_navigation.gd
 - The test should not pass initially because the implementation is not done yet
 - The test should use the test_navigation_scene.tscn scene
 - Player is at world coordinate 0,0 which is also tilemap grid position 0,0
 - The edge to the player's bottom left is grid position (0,2), top right is (0,-7)
 - The corners of the map grid positions are: top (-4,-7), right: (4, -7), bottom (4, 2), left(-4, 2)
 - The integration test should call the character_controller_point_and_click.gd `_on_mouse_click` to move the character to grid position (2, -4)
 - Validate the character moved to that cell after a couple seconds worth of frames
 - It should also enable the `_debug_path_logging` for this test so we can see everything the player does in the logs

### Implement File Structure
- projects/isometric_2d_prototype/isometric_2d_prototype
    - #file:isometric_navigation.gd 
        - rename to a_star_grid_2d_navigation.gd
        - Mark this file as deprecated
    - a_star_2d_navigation.gd
        - Main file for new functionality
        - Use same interface as a_star_grid_2d_navigation.gd so #file:character_controller_point_and_click.gd can call it interchangably
        - Include similar functionality as a_star_grid_2d_navigation.gd for draw_debug, debug_path_logging, highlighted_tile and click_position
        - Use AStar2D to implement navigation in this file instead of AStarGrid2D
        - Implement with notes from high level overview
    - #file:test_navigation_scene.tscn 
        - Update %Isometric-Navigation node to use the new navigation class

### Double check your implementation
 - Make sure the High Level Overview was implemented correctly
 - Append the notes of your review to change_notes.md

### Verification
Run integration tests to verify the implementation via commandline:
 - .\scripts\run_tests.bat <script_path>
 - Example: .\scripts\run_tests.bat tests/integration/test_non_grid_navigation.gd
- There are no errors
- The log messages are as expected