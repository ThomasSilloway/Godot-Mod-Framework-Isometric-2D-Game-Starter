# Coordinate System Fix Risk Assessment

## Overview
The player is at world position (0,0) but maps to grid position (-1,0) instead of (0,0). This document outlines the minimal testing needed to verify coordinate system alignment between TileMapLayer and AStar grid.

## Core Validation Required

### 1. Coordinate System Alignment Test
**Objective**: Verify that TileMapLayer and AStar grid coordinates match at key positions

**Test Points**:
- World position (0,0) → should map to grid (-1,0) in both systems
- Grid position (0,0) → should map to same world position in both systems

**Validation Method**:
1. Use debug visualization to show both coordinate systems
2. Verify player position shows correct grid coordinate (-1,0)
3. Compare TileMapLayer.local_to_map() with _world_to_grid() results

### 2. Grid Origin Behavior
**Risk**: Different interpretation of grid origin between systems

**Test Points**:
1. TileMapLayer grid origin (0,0):
   - Where it maps in world coordinates
   - Visual location in scene

2. AStar grid origin (0,0):
   - Where it maps in world coordinates
   - Visual location in scene

**Validation Method**:
- Use world_debug_draw.gd to visualize both grid systems simultaneously
- Confirm grid origins align visually and numerically

## Implementation Recommendations

1. **Testing Approach**:
   - Focus on (0,0) and (-1,0) coordinate validation
   - Use existing debug visualization
   - Log coordinate conversions for these specific points

2. **Validation Steps**:
   - Enable debug coordinate display
   - Test conversion at world origin (0,0)
   - Verify grid position (-1,0) display

## Success Criteria

1. World position (0,0) correctly maps to grid position (-1,0) in both:
   - AStar navigation system
   - TileMapLayer coordinate system
2. Debug visualization shows consistent coordinates between systems
3. Player position shows correct grid coordinates