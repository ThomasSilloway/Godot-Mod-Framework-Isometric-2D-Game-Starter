## A node that manages wall detection and caching for an isometric 2D grid navigation system.
## Handles wall detection in 8 directions (N,S,E,W,NE,NW,SE,SW) using a hybrid approach:
## - Orthogonal walls (N,S,E,W) are cached directly from tilemaps
## - Diagonal movement checks are computed from combinations of orthogonal walls
## Each wall type has its own tilemap layer and caches its connections separately
extends Node2D

@export var _debug_path_logging := false  # Debug flag for controlling path logs

# Constants for wall types
enum WallType {
	EAST = 0,  # bottom right wall - EW tilemap
	WEST = 1,  # top left wall - EW tilemap
	NORTH = 2, # top right wall - NS tilemap
	SOUTH = 3  # bottom left wall - NS tilemap
}

## Dictionary mapping cell pairs to wall presence
## Key format: "x1,y1-x2,y2" where points are ordered by y then x
## Value: true if wall exists between points
var _wall_cache := {}

## Dictionary mapping WallType to corresponding TileMapLayer nodes
var _wall_tilemaps := {}

## Initializes wall detection system by:
## 1. Getting references to all wall tilemaps
## 2. Pre-caching wall data from each tilemap's used cells
## 3. Storing wall information for both source and neighbor cells
func _ready() -> void:
	# Get references to wall tilemaps
	var wall_layers := {
		WallType.EAST: get_node_or_null("%TileMapLayer-Walls-East"),
		WallType.WEST: get_node_or_null("%TileMapLayer-Walls-West"),
		WallType.NORTH: get_node_or_null("%TileMapLayer-Walls-North"),
		WallType.SOUTH: get_node_or_null("%TileMapLayer-Walls-South")
	}
	
	# Store valid tilemaps and pre-cache their wall data
	for type in wall_layers:
		# TEMP: Only process east walls for now
		# if type != WallType.WEST:
		# 	continue
		var tilemap: TileMapLayer = wall_layers[type]
		if tilemap:
			_wall_tilemaps[type] = tilemap
			# Get used rect to know bounds to check
			var rect := tilemap.get_used_rect()
			# Cache all walls in this tilemap
			for x in range(rect.position.x - 1, rect.position.x + rect.size.x + 1):
				for y in range(rect.position.y - 1, rect.position.y + rect.size.y + 1):
					var pos := Vector2i(x, y)
					if _check_wall(pos, type):
						# Cache wall presence for this position and all affected neighbors
						_cache_wall_and_neighbors(pos, type)
			
			if _debug_path_logging:
				var type_name: String = WallType.keys()[type]
				print("Total cached walls after parsing %s: %d walls" % [type_name, _wall_cache.size()])
		else:
			var type_name: String = WallType.keys()[type]
			push_warning("Wall tilemap not found for type: %s" % type_name)

## Caches wall presence for a given position and wall type.
## Updates cache for both the source cell and affected neighbor based on wall type:
## - EAST: Blocks (x,y) <-> (x+1,y)
## - WEST: Blocks (x,y) <-> (x-1,y)
## - NORTH: Blocks (x,y) <-> (x,y-1)
## - SOUTH: Blocks (x,y) <-> (x,y+1)
## @param pos: Source cell position
## @param wall_type: Type of wall to cache
func _cache_wall_and_neighbors(pos: Vector2i, wall_type: WallType) -> void:
	var offset := Vector2i.ZERO
	match wall_type:
		WallType.EAST:   offset = Vector2i(1, 0)
		WallType.WEST:   offset = Vector2i(-1, 0)
		WallType.NORTH:  offset = Vector2i(0, -1)
		WallType.SOUTH:  offset = Vector2i(0, 1)
	
	var neighbor := pos + offset
	var key := _get_cache_key(pos, neighbor)
	# if _debug_path_logging:
	# 	print("  - Creating cache key: ", key)
	_wall_cache[key] = true
	
	if _debug_path_logging:
		print("  - Wall detected: %d,%d -> %d,%d" % [pos.x, pos.y, neighbor.x, neighbor.y])

## Creates a consistent cache key for two positions.
## Always orders points by y-coordinate then x-coordinate to ensure
## the same key is generated regardless of point order.
## @return: String in format "x1,y1-x2,y2"
func _get_cache_key(pos1: Vector2i, pos2: Vector2i) -> String:
	# Create a consistent cache key regardless of point order
	var ordered = [pos1, pos2]
	ordered.sort_custom(func(a, b): 
		if a.y != b.y: return a.y < b.y
		return a.x < b.x
	)
	return "%d,%d-%d,%d" % [ordered[0].x, ordered[0].y, ordered[1].x, ordered[1].y]

## Checks if a wall exists between two adjacent cells.
## Uses hybrid approach:
## 1. For orthogonal movement: Checks cache, then tilemaps if not cached
## 2. For diagonal movement: Checks both possible orthogonal paths
## Note: Only checks cells within sqrt(2) distance (adjacent including diagonals)
## @return: true if wall blocks movement between the cells
func has_wall_between(pos1: Vector2i, pos2: Vector2i) -> bool:
	# Only check neighboring cells
	var diff := pos2 - pos1
	if diff.abs().length() > 1.5:
		return false
	
	# First check orthogonal directions using cache
	if diff.x == 0 or diff.y == 0:
		var cache_key = _get_cache_key(pos1, pos2)
		if cache_key in _wall_cache:
			return _wall_cache[cache_key]
		
		# Double check all wall types at both positions
		for type in WallType.values():
			if (_check_wall(pos1, type) and _affects_movement(pos1, pos2, type)) or \
			   (_check_wall(pos2, type) and _affects_movement(pos2, pos1, type)):
				_wall_cache[cache_key] = true
				return true
	else:
		# For diagonal movement, check both orthogonal paths
		var midpoint1 := Vector2i(pos1.x, pos2.y)
		var midpoint2 := Vector2i(pos2.x, pos1.y)
		
		# Check if either orthogonal path is blocked
		return has_wall_between(pos1, midpoint1) or has_wall_between(midpoint1, pos2) or \
			   has_wall_between(pos1, midpoint2) or has_wall_between(midpoint2, pos2)
	
	return false

## Determines if a wall at wall_pos affects movement to target_pos
## based on the wall type.
## Used to validate wall cache entries and compute blocking.
## @return: true if the wall blocks movement between the positions
func _affects_movement(wall_pos: Vector2i, target_pos: Vector2i, wall_type: WallType) -> bool:
	var diff := target_pos - wall_pos
	match wall_type:
		WallType.EAST:
			return diff == Vector2i(1, 0)
		WallType.WEST:
			return diff == Vector2i(-1, 0)
		WallType.NORTH:
			return diff == Vector2i(0, -1)
		WallType.SOUTH:
			return diff == Vector2i(0, 1)
	return false

## Checks if a wall exists at a specific position and type
## by querying the corresponding tilemap.
## @return: true if wall exists at position
func _check_wall(pos: Vector2i, wall_type: WallType) -> bool:
	if not wall_type in _wall_tilemaps:
		if _debug_path_logging:
			var type_name: String = WallType.keys()[wall_type]
			print("No tilemap found for wall type: %s" % type_name)
		return false
	
	var tilemap: TileMapLayer = _wall_tilemaps[wall_type]
	var cell_data = tilemap.get_cell_tile_data(pos)
	# if _debug_path_logging and cell_data != null:
	# 	var type_name: String = WallType.keys()[wall_type]
	# 	print("Checking wall at pos: %s type: %s result: true" % [pos, type_name])
	return cell_data != null

## Rebuilds the entire wall cache by clearing and re-running _ready()
func clear_cache() -> void:
	# Rebuild the cache
	_wall_cache.clear()
	_ready()

## Returns array of wall types present at given position
## Useful for debugging wall configuration at a specific cell
## @return: Array of WallType values for walls at position
func get_wall_directions(pos: Vector2i) -> Array[WallType]:
	var walls: Array[WallType] = []
	for wall_type in WallType.values():
		if _check_wall(pos, wall_type):
			walls.append(wall_type)
	return walls

## Returns a debug-friendly string representation of the wall cache
## for a specific position, showing all cached walls affecting this cell.
## Useful for debugging wall configuration issues.
## @param pos: The position to inspect
## @return: String describing all cached walls affecting this position
func debug_wall_cache(pos: Vector2i) -> String:
	var result := []
	var directions := {
		Vector2i(1, 0): "EAST",
		Vector2i(-1, 0): "WEST",
		Vector2i(0, -1): "NORTH",
		Vector2i(0, 1): "SOUTH",
		Vector2i(1, -1): "NORTHEAST",
		Vector2i(-1, -1): "NORTHWEST",
		Vector2i(1, 1): "SOUTHEAST",
		Vector2i(-1, 1): "SOUTHWEST"
	}
	
	for offset in directions:
		var neighbor: Vector2i = pos + offset
		var key := _get_cache_key(pos, neighbor)
		if key in _wall_cache:
			result.append("%s wall cached: %s" % [directions[offset], _wall_cache[key]])
	
	if result.is_empty():
		return "No cached walls found affecting position %s" % pos
	
	return "Cached walls at %s:\n%s" % [pos, "\n".join(result)]
