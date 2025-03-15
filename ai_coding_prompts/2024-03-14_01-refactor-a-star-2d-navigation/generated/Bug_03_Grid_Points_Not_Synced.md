# Bug Analysis: Grid Points Not Synced Initially

## Bug Description
When enabling _debug_show_coordinates in the debug visualization component, coordinates are not displayed until a path is calculated or the grid is updated. This indicates that the initial grid points are not being properly synchronized between the navigation and debug visualization systems.

## Potential Solutions

### Solution 1: Get Points in _ready()
- **Approach**: Request debug points directly in the debug visualization's _ready() function
- **Implementation**: Add `_debug_points = navigation.get_debug_points()` in _ready() after connecting signals
- **Pros**: Simple, immediate solution that works with existing code
- **Cons**: Points are only fetched once at initialization

### Solution 2: Add Grid Update Signal
- **Approach**: Add a grid_updated signal to the navigation system that emits when grid points change
- **Implementation**: 
  - Add signal to navigation system
  - Emit signal after grid setup
  - Connect to signal in debug visualization
- **Pros**: Handles both initial sync and future grid updates
- **Cons**: Adds complexity with new signal

### Solution 3: Automatic Point Polling
- **Approach**: Periodically check for grid point updates in the debug visualization
- **Implementation**: Add a timer to regularly fetch points from navigation system
- **Pros**: Would catch all changes automatically
- **Cons**: Inefficient, wastes resources checking when nothing has changed

## Evaluation
Solution 2 (Add Grid Update Signal) provides the best balance between functionality and maintainability. It ensures proper synchronization at startup while also supporting future grid updates, and follows Godot's signal-based communication pattern.

## Implementation Plan
1. Add grid_updated signal to a_star_2d_navigation.gd
2. Emit signal after grid setup in _setup_grid()
3. Connect to signal in world_debug_draw.gd's _ready()
4. Also fetch points immediately after connecting signals
5. Implement _on_grid_updated handler to update points

This approach maintains clean separation of concerns while ensuring the debug visualization always has current grid data.