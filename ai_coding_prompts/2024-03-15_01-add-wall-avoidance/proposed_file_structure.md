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
