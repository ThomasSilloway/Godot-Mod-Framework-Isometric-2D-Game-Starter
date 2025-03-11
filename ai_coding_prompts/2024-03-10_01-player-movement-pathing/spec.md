# 2d isometric game built with godot 4.4

## High Level Overview

Update an isometric 2d Godot mod project called isometric_2d_prototype with point and click movement for the player character. When the player clicks on the screen, the character should move to that point. The character should also play a walking animation while moving and stop when it reaches the destination. We also need a debug flag we can flip on to see the pathfinding grid and the path that the character will take to reach the destination.

## End State (feedback Loop)

Run `scripts/build_standalone.bat isometric_2d_prototype` and confirm:
- There are no errors

## Implementation Details
 - Use only Godot 4.4 syntax
 - See `isometric_2d_prototype\isometric_2d_prototype.md` for the structure of the `main_scene` and `character` scenes
 - The `isometric_2d_prototype\isometric_2d_prototype\character\character.tscn` scene contains the player
 - The tile size is 256x128, using isometric tiles, Diamond Down layout
 - Use `AStarGrid2D` for pathfinding
 - Player should be able to move in 8 directions (up, down, left, right, and diagonals)
 - Player should always move in a straight line from one tile to the next
 - When the player is moving, nothing else in the scene will be moving, so we don't need to worry about dynamically moving objects for collision
 - Don't try to open the godot editor to test or verify or for any reason

## File Structure
 - projects/isometric_2d_prototype/isometric_2d_prototype
   - character_controller
      - character_controller_point_and_click.gd
        - Create this file
        - Export a variable `speed` to control the speed of the player
        - include signal direction_changed(direction: Vector2) which is emitted to update the sprite's animation
        - use `AStarGrid2D` node to do the navigation
        - Do the movement updates in `_physics_process`
        - Mouse button click should calculate the target position and update the `NavigationAgent2D` target position
    - characters/proto_male_kenny
      - character_male_kenny.tscn
        - Update to use the new `character_controller_point_and_click.gd` script

## Double check your implementation
```
 - Make sure the High Level Overview was implemented correctly
```

## Verification
```
Run `scripts/build_standalone.bat isometric_2d_prototype` and confirm:
- There are no errors
```