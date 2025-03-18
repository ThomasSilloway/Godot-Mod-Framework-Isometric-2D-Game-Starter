class_name UtilGrid
extends Node

# Reference to the ground tilemap for coordinate conversions
var _ground_tilemap: TileMapLayer
var _cell_size := Vector2(256, 128) # Default isometric tile size
var _map_rect: Rect2i # Store map rectangle for bounds checking

func _ready() -> void:
	# Get reference to the ground tilemap
	_ground_tilemap = get_node("%TileMapLayer-Ground")
	if _ground_tilemap:
		# Initialize the map rectangle for bounds checking
		_map_rect = _ground_tilemap.get_used_rect()
	else:
		push_error("UtilGrid: TileMapLayer-Ground node not found. Coordinate conversions may not work correctly.")

## Converts world position to grid coordinates
## @param pos: Vector2 - world position to convert
## @return Vector2i - the corresponding grid position
func world_to_grid(pos: Vector2) -> Vector2i:
	# Use TileMapLayer's conversion for consistency
	return _ground_tilemap.local_to_map(pos) if _ground_tilemap else Vector2i()

## Converts grid coordinates to world position
## @param grid_pos: Vector2i - grid position to convert
## @return Vector2 - the corresponding world position
func grid_to_world(grid_pos: Vector2i) -> Vector2:
	# Use TileMapLayer's conversion for consistency
	return _ground_tilemap.map_to_local(grid_pos) if _ground_tilemap else Vector2()

## Gets the center of the tile at the specified world position
## @param world_pos: Vector2 - world position to find tile center for
## @return Vector2 - the center position of the tile
func get_tile_center(world_pos: Vector2) -> Vector2:
	var grid_pos = world_to_grid(world_pos)
	return grid_to_world(grid_pos)

## Finds the closest valid grid position within map boundaries
## @param pos: Vector2 - world position to find valid grid position for
## @return Vector2i - the closest valid grid position
func get_closest_valid_grid_position(pos: Vector2) -> Vector2i:
	if not _ground_tilemap:
		push_error("UtilGrid: Cannot find valid grid position without TileMapLayer-Ground")
		return Vector2i()
	
	var grid_pos = world_to_grid(pos)
	
	# If the calculated grid position is not valid, find the closest valid one
	if not _map_rect.has_point(grid_pos):
		var closest_distance := INF
		var closest_pos := Vector2i()
		
		# Check surrounding grid cells to find the closest valid one
		for x in range(-1, 2):
			for y in range(-1, 2):
				var test_pos = grid_pos + Vector2i(x, y)
				if _map_rect.has_point(test_pos):
					var world_test_pos : Vector2 = grid_to_world(test_pos)
					var distance = pos.distance_to(world_test_pos)
					if distance < closest_distance:
						closest_distance = distance
						closest_pos = test_pos
		
		return closest_pos
	
	return grid_pos

## Debug function to validate coordinate conversions
## @param world_pos: Vector2 - world position to validate conversion for
func debug_coordinates(world_pos: Vector2) -> void:
	var grid_pos = world_to_grid(world_pos)
	var reconverted_world = grid_to_world(grid_pos)
	print("Original world: ", world_pos)
	print("Converted to grid: ", grid_pos)
	print("Back to world: ", reconverted_world)
