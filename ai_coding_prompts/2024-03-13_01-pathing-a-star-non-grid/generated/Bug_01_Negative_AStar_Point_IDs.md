# Bug: AStar2D Does Not Support Negative Point IDs

## Problem
The current implementation generates negative point IDs for negative grid coordinates, but AStar2D does not support negative point IDs. This causes errors when trying to add points to the navigation graph.

## Potential Solutions

### 1. Offset Grid Coordinates
- **Approach**: Add an offset to grid coordinates to make them all positive before ID generation
- **Pros**: 
  - Simple to implement
  - Preserves relative positions
  - No changes needed to path finding logic
- **Cons**:
  - Need to carefully choose offset to avoid overflow
  - Adds a constant transformation step

### 2. Use Absolute Position Based IDs
- **Approach**: Generate IDs based on absolute position in the map
- **Pros**:
  - Naturally positive numbers
  - Direct mapping to position
- **Cons**:
  - More complex coordinate transforms
  - Could be less intuitive for debugging

### 3. Custom Bijective Function
- **Approach**: Create a custom bijective function that maps any integer pair to a unique positive integer
- **Pros**:
  - Mathematically elegant
  - No offset needed
- **Cons**:
  - More complex to implement
  - Potentially harder to debug

## Selected Solution
Solution 1: Offset Grid Coordinates is the best choice because:
- Simplest to implement and understand
- Maintains the existing logic structure
- Low performance impact
- Easy to debug and maintain

## Implementation Notes
1. Calculate the minimum x and y coordinates from the map bounds
2. Add absolute value of minimum coordinates plus 1 to ensure all values are positive
3. Apply offset before ID generation
4. Store offset values for reverse calculations