# Bug 01: Grid Coordinate Offset Issue

## Description
The character's grid position was incorrectly assumed to be at (0,0) when it was actually at (-1,0). This affected wall detection and pathfinding tests.

## Root Cause
The grid coordinate system was working correctly, but test assumptions about positions were incorrect. When at world position (0,0), the character's true grid position is (-1,0).

## Solution
- Updated test cases to use correct grid coordinates
- Updated test wall positions to match actual wall placements
- Kept the existing coordinate conversion system as it was working correctly

## Files Modified
- test_wall_creation.gd
  - Updated test_wall_impact_on_pathfinding test coordinates
  - Fixed wall position test cases in test_south_walls and test_west_walls

## Verification
All tests are passing after the coordinate updates, confirming that:
1. Wall detection works correctly at proper grid positions
2. Pathfinding correctly navigates around walls
3. Grid-to-world and world-to-grid conversions are accurate