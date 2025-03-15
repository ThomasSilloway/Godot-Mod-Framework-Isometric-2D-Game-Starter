# Change Notes

## v01 - Coordinate System Fix

### Overview
- Fixing coordinate system discrepancy between TileMapLayer and AStar grid
- Implementing proper coordinate system visualization
- Adding coordinate system validation tests

### Details
1. Coordinate System Clarification:
   - World position (0,0) correctly maps to grid position (-1,0)
   - This behavior is now properly documented and validated
   - No changes needed to this mapping as it is correct

2. Coordinate System Alignment:
   - TileMapLayer and AStar grid coordinates are now aligned
   - Added validation in unit tests to ensure consistency
   - Added debug visualization toggle for both coordinate systems

3. Debug Visualization Updates:
   - Added toggle functionality to switch between coordinate systems
   - Using different colors/styles for clear distinction
   - Ensuring correct grid coordinate display

### Implementation Review
1. Coordinate System Verification:
   - Unit tests confirm correct world-to-grid mapping
   - Both TileMap and AStar systems agree on coordinates
   - All conversion functions maintain consistency

2. Debug Visualization:
   - Implemented enum-based coordinate system toggle
   - Clear visual distinction between coordinate systems
   - Added on-screen coordinate system mode indicator

3. Feature List Compliance:
   - All existing navigation features preserved
   - Coordinate system documentation updated
   - Debug visualization capabilities enhanced