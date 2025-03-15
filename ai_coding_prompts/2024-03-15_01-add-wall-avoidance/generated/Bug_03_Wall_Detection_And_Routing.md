# Bug 02: Wall Detection and Routing Issues

## Problems

1. Wall Detection
   - South wall between (2,0) and (2,-1) not detected
   - West walls (-1,-1), (-1,-2), (-1,-3) not detected
   - Could be direction-specific issue in wall checking

2. Path Routing
   - Path taking wrong route: [(0,0), (1,0), (2,0), (2,-1), (1,-1), (0,-1)]
   - Should be: [(0,0), (3,0), (3,-1), (0,-1)]
   - Not properly routing around west wall via (-1,-4)

## Possible Solutions

### Solution 1: Fix Wall Direction Handling
- Update _check_wall() to consider both source and destination points
- For each wall direction, check both points for walls
- Keep wall cache but improve key generation
- Medium complexity, addresses core issue

### Solution 2: Complete Wall Graph Rebuild
- Rebuild point connections whenever wall check fails
- Cache entire graph state instead of individual walls
- Higher complexity but could be more maintainable
- Risk of performance impact

### Solution 3: Directional Cost Weighting
- Keep current wall detection 
- Add very high costs for paths near walls
- Encourage paths to stay away from walls
- Simple but might not fully solve issue

## Selected Solution

Implementing Solution 1 because:
- Most directly addresses the wall detection issues
- Maintains current performance characteristics
- Lower risk than full graph rebuild
- Can be implemented with minimal changes

## Implementation Plan

1. Update wall detection:
   - Check both source and dest points for walls
   - Fix north/south wall direction logic
   - Improve cache key generation

2. Fix path weighting:
   - Update _compute_cost for wall-adjacent paths
   - Add higher costs near wall corners
   - Ensure INF cost for wall crossings