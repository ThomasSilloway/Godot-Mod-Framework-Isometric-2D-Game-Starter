# Bug: Non-Adjacent AStar2D Node Connections

## Problem
The initial implementation connected every node directly to every other node in the graph. This caused the character to move in straight lines between points instead of following a proper tile-by-tile path, which is incorrect for grid-based movement in an isometric game.

## Example
Moving from (0,0) to (2,-4) produced a path with only two points:
```
[(0.0, 0.0), (768.0, -128.0)]
```
Instead of a proper tile-by-tile path like:
```
[(0.0, 0.0), (128.0, -64.0), (256.0, -128.0), (512.0, -128.0), (768.0, -128.0)]
```

## Potential Solutions

### 1. Eight-Way Adjacent Connections
- **Approach**: Only connect each node to its 8 immediate neighbors
- **Pros**:
  - Natural grid-based movement
  - Consistent with isometric grid expectations
  - Simple to implement and maintain
- **Cons**:
  - Slightly more complex path calculation
  - May need tuning for diagonal movement costs

### 2. Distance-Based Connections
- **Approach**: Connect nodes within a specific distance threshold
- **Pros**:
  - More flexible movement options
  - Could be useful for different unit types
- **Cons**:
  - Harder to control movement patterns
  - May still allow unrealistic shortcuts
  - More connections to process

### 3. Four-Way Adjacent Connections
- **Approach**: Only allow orthogonal connections
- **Pros**:
  - Simplest to implement
  - Most predictable movement
- **Cons**:
  - Movement looks unnatural in isometric view
  - Longer paths than necessary

## Selected Solution
Solution 1: Eight-Way Adjacent Connections was chosen because:
- Most natural for isometric grid movement
- Balances flexibility and control
- Can be weighted to prefer orthogonal movement
- Easy to understand and debug

## Implementation Notes
1. Define the 8 possible neighbor directions
2. During grid setup, only connect to valid adjacent tiles
3. Use weighting (1.0 for orthogonal, 1.4 for diagonal) to prefer orthogonal movement
4. Calculate neighbor positions using grid coordinates
5. Validate neighbor positions against map bounds