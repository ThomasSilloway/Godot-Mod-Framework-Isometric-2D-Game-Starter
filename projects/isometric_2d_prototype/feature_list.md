# Isometric 2D Prototype - Feature List

This document provides a comprehensive list of features currently implemented in the Isometric 2D Prototype project.

## 1. Navigation System

### Feature Name
AStar2D Navigation System

### Description
A non-grid based pathfinding system that uses Godot's AStar2D algorithm to calculate paths in an isometric 2D world.

### Purpose
To provide efficient and accurate pathfinding for characters in an isometric environment, with support for future enhancements like collision detection.

### How it works
1. Core Navigation Component:
   - Creates a graph of points based on the tilemap's used rectangle
   - Each grid position is assigned a unique positive ID
   - Points are connected to their neighbors (8-way connections)
   - Handles all pathfinding calculations using AStar2D
   - Emits signals for path calculation and state updates

2. Debug Visualization Component:
   - Listens for navigation events and state changes
   - Visualizes navigation points, paths, and connections
   - Displays coordinate information
   - Provides visual feedback for debugging

3. Pathfinding Process:
   - Converts world coordinates to grid coordinates
   - Finds path using AStar2D
   - Converts result back to world coordinates
   - Emits progress updates during pathfinding

### Technical specifications
- **Coordinate Systems**:
  - World Coordinates: Vector2 positions in the game world
  - Grid Coordinates: Vector2i logical grid positions
  - Point IDs: Unique integer IDs for AStar2D points

- **Point Management**:
  ```
  // ID Generation Formula
  id = (grid_pos.x + offset.x) * 100000 + (grid_pos.y + offset.y)
  ```

- **Coordinate Conversion**:
  ```
  // World to Grid
  grid_x = (world_x / (cell_size.x/2) + world_y / (cell_size.y/2)) / 2
  grid_y = (world_y / (cell_size.y/2) - world_x / (cell_size.x/2)) / 2

  // Grid to World
  world_x = (grid_pos.x - grid_pos.y) * (cell_size.x/2)
  world_y = (grid_pos.x + grid_pos.y) * (cell_size.y/2)
  ```

### Known bugs or limitations
- Currently no support for obstacles or collision detection
- Fixed tile size (256x128)
- All points are connected with the same weight pattern
- Debug visualization can impact performance when showing all elements

### Bug fixes
- **Negative AStar Point IDs**: AStar2D does not support negative point IDs which caused errors when adding points to the navigation graph. Fixed by adding an offset to grid coordinates to make them all positive before ID generation.
- **Code Organization**: Navigation and debug functionality were tightly coupled. Fixed by splitting into separate components using a composition-based approach.

### Related files
- Core Navigation: `navigation/a_star_2d_navigation.gd`
- Debug Visualization: `debug/world_debug_draw.gd`
- Original Implementation: `navigation/a_star_grid_2d_navigation.gd` (deprecated)

### Related documentation
- `ai_coding_prompts/2024-03-13_01-pathing-a-star-non-grid/generated/architecture_document.md`
- `ai_coding_prompts/2024-03-13_01-pathing-a-star-non-grid/generated/Bug_01_Negative_AStar_Point_IDs.md`
- `ai_coding_prompts/2024-03-14_01-refactor-a-star-2d-navigation/generated/Risk_01_AStar_Split_Analysis.md`

## 2. Character Controllers

### Feature Name
Point and Click Character Controller

### Description
A character controller that allows players to move characters by clicking on a destination point in the game world.

### Purpose
To provide an intuitive way for players to control character movement using mouse input in an isometric environment.

### How it works
1. Captures left-click input events
2. Gets the target position from the mouse click
3. Requests a path from the navigation system
4. Moves the character along the calculated path
5. Notifies other components (like animations) about direction changes

### Technical specifications
- Movement speed: 200 units per second (configurable)
- Arrival threshold: 5 units (configurable)
- Emits direction_changed signals for animation integration
- Automatically handles stopping at the end of paths

### Known bugs or limitations
- No path smoothing
- No obstacle avoidance
- Fixed movement speed (no acceleration/deceleration)

### Related files
- `character_controller/character_controller_point_and_click.gd`

---

### Feature Name
WASD Character Controller

### Description
A character controller that allows players to move characters using the WASD keyboard keys.

### Purpose
To provide direct keyboard-based movement control for characters.

### How it works
Listens for WASD key inputs and moves the character in the corresponding direction, with appropriate isometric mapping of directions.

### Technical specifications
- Direct keyboard control
- Supports 8 directions of movement (including diagonals)
- Automatically integrates with character animations

### Known bugs or limitations
- No pathfinding integration
- Fixed movement speed

### Related files
- `character_controller/character_controller_WASD.gd`

## 3. Character Animation System

### Feature Name
Direction-based Character Animation System

### Description
A character animation system that changes animations based on the character's movement direction.

### Purpose
To provide visually appropriate animations for characters as they move around the isometric environment.

### How it works
1. Listens for direction_changed signals from character controllers
2. Maps direction vectors to animation states (idle, walk_n, walk_ne, etc.)
3. Plays the appropriate animation based on the current direction

### Technical specifications
- Supports 8 directions of animation
- Automatically handles idle states
- Integrated with character controllers

### Known bugs or limitations
- Limited to 8 directions
- No transition blending between animations

### Related files
- `characters/animation_player.gd`
- `characters/proto_female/character_female.tscn`
- `characters/proto_male_kenny/`

## 4. Isometric TileMapLayer System

### Feature Name
Isometric TileMapLayer System

### Description
A system for creating and rendering isometric game environments using Godot's TileMapLayer system, which is the updated replacement for the deprecated TileMap node in Godot 4.4.

### Purpose
To provide the visual foundation for the isometric game world and define the navigable space.

### How it works
1. Uses Diamond Down layout for isometric rendering
2. Uses TileMapLayer nodes to create individual layers (rather than the old multi-layer TileMap)
3. Provides tile definitions for the game world through a shared TileSet resource
4. Defines the boundaries of the navigable area

### Technical specifications
- Tile size: 256x128 pixels
- Diamond Down isometric layout
- Each TileMapLayer handles a single layer of tiles (ground, objects, etc.)
- World-to-map coordinate conversion for mouse interaction
- Supports navigation regions for pathfinding
- Multiple tilemap prototypes available

### Known bugs or limitations
- Limited tile variety in prototypes
- Manual layer management required (compared to the deprecated TileMap's built-in layers)
- No dynamic tile changes
- Memory usage increases with each additional TileMapLayer

### Related files
- `tilemap_proto_01/`
- `tilemap_proto_02_kenny_farm/`

### Related documentation
- Godot 4.4 TileMapLayer documentation

## 5. Debug Visualization Tools

### Feature Name
Debug Visualization System

### Description
A system for visually debugging game elements like navigation paths, grid points, and tile selections.

### Purpose
To assist developers in understanding and troubleshooting the game's systems, particularly navigation and movement.

### How it works
1. Adds visual indicators for navigation points, paths, and connections
2. Highlights selected tiles
3. Shows coordinate information in the world
4. Provides logging options for detailed debugging information

### Technical specifications
- Configurable debug drawing options
- In-game visualization of technical elements
- Coordinate system visualization
- Path highlighting

### Known bugs or limitations
- Can be performance-intensive when showing all debug elements
- Debug visualization is always rendered above game elements

### Related files
- Debug drawing functionality in `navigation/a_star_2d_navigation.gd`
- `debug/` directory

## 6. Testing Scenes

### Feature Name
Navigation Testing Scenes

### Description
Dedicated scenes for testing navigation and movement systems.

### Purpose
To provide isolated environments for testing and demonstrating specific game systems.

### How it works
Provides pre-configured scenes with the necessary components to test navigation, character movement, and other systems.

### Technical specifications
- Minimal test environments
- Preconfigured for specific testing scenarios
- Includes debugging tools

### Related files
- `test_navigation_scene.tscn`
- `test_navigation_collision_scene.tscn`