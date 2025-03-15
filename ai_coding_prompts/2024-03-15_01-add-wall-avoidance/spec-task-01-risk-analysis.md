# Overview

  Update a_star_2d_navigation.gd to respect colliders like walls. For example if there's a wall between 0,0 and 0,-1 those two cells should not be connected and the player should not try to run directly there, it should run around the wall

## Docs

 - folder: ai_docs/GUT_unit_testing
 - file: ai_docs/godot/astar2d.md

## Related files
 - Project Directory: projects\isometric_2d_prototype
 - file: projects/isometric_2d_prototype/isometric_2d_prototype/navigation/a_star_2d_navigation.gd
 - file: projects\isometric_2d_prototype\isometric_2d_prototype\test_navigation_collision_scene.tscn
 - file: projects\isometric_2d_prototype\tests\integration\test_non_grid_navigation.gd

## Project Details
 - Use only Godot 4.4 syntax
 - The tile size is 256x128, using isometric tiles, Diamond Down layout

## Technical Clarifications
 - The current A* implementation completely ignores walls
 - Movement should use cardinal directions (N-E-S-W) when handling wall collisions
 - When no walls are encountered, the player can move in all 8 directions
 - The TileMapLayer-Walls-East/West/North/South nodes are already implemented in the test scene
 - Debug visualization is already implemented with export variables that can be toggled on/off

## Proposed file structure
- projects/isometric_2d_prototype/isometric_2d_prototype
  - navigation/wall_collision_detector.gd
    - A new class that handles figuring out which nodes are connected to which
    - The walls can be found in the `TileMapLayer-Walls-East` node and `TileMapLayer-Walls-West` node, etc for North and South too
     - If there's a tile in the East node, the wall is on the bottom right side of the tile
     - If there's a tile in the West node, the wall is on the top left side of the tile
     - If there's a tile in the North node, the wall is on the top right side of the tile
     - If there's a tile in the South node, the wall is on the bottom left side of the tile
  - navigation/a_star_2d_navigation.gd 
     - Update `setup_grid` to handle collision from walls using the wall_collision_detector.gd
     - It should not connect points that are separated by walls
     

## Tasks

### Create Planning Documents
 - Create each file inside the current directory of this spec file under the folder: generated

#### Risk Assessment
- Create a risks document under the folder: generated called risk_assessment.md
- Identify potential implementation challenges or risks
- For each risk, provide a mitigation strategy
- Consider edge cases (e.g., negative coordinates, boundary conditions)
- Document any areas where the implementation might diverge from existing systems
