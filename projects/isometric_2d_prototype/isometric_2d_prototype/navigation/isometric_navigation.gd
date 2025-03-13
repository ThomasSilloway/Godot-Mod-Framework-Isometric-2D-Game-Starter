extends Node2D

var _astar := AStarGrid2D.new()
var _current_path: PackedVector2Array
@export var _debug_draw := false:
	set(value):
		_debug_draw = value
		queue_redraw()
@export var _debug_path_logging := false  # New debug flag for controlling path logs

var _highlighted_tile: Vector2i
var _click_position: Vector2  # Added to store the actual click position

func _ready() -> void:
	var tilemap : TileMapLayer = get_node("%TileMapLayer-Ground")
	if tilemap:
		_setup_grid(tilemap)
	else:
		push_warning("Tilemap not found. Pathfinding will not work.")

func _setup_grid(tilemap: TileMapLayer) -> void:
	var map_rect: Rect2i = tilemap.get_used_rect()
	
	_astar.cell_size = Vector2(256, 128) # Isometric tile size
	_astar.offset = -Vector2(128, 64)
	_astar.region = map_rect
	_astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_ALWAYS
	_astar.cell_shape = AStarGrid2D.CELL_SHAPE_ISOMETRIC_DOWN
	_astar.update()
	
	# Print debug info to understand coordinate system
	if _debug_path_logging:
		print("AStar Region: ", _astar.region)
		var test_pos = Vector2(0, 0)
		var grid_pos = _world_to_grid(test_pos)
		print("World (0,0) → Our grid: ", grid_pos)
		
		# Let's check a grid position to world position conversion
		var world_pos = _grid_to_world(grid_pos)
		print("Grid ", grid_pos, " → World: ", world_pos)
		
		# Check AStar's position for this grid coordinate
		var astar_world_pos = _astar.get_point_position(grid_pos)
		print("AStar world position for grid ", grid_pos, ": ", astar_world_pos)

func calculate_path(start_pos: Vector2, end_pos: Vector2) -> PackedVector2Array:
	_click_position = end_pos  # Store the actual click position for debugging
	var start_grid_pos = _world_to_grid(start_pos)
	var end_grid_pos = _world_to_grid(end_pos)
	
	if _debug_path_logging:
		print("Start Grid Position: ", start_grid_pos)
		print("End Grid Position: ", end_grid_pos)
		
		# Debug position conversions
		print("Start World: ", start_pos, " → Grid: ", start_grid_pos, " → Back to World: ", _grid_to_world(start_grid_pos))
		print("End World: ", end_pos, " → Grid: ", end_grid_pos, " → Back to World: ", _grid_to_world(end_grid_pos))
	
	# Get path in grid coordinates
	var grid_path = _astar.get_id_path(start_grid_pos, end_grid_pos)
	
	# Convert grid path to world positions with proper tile center adjustment
	_current_path = PackedVector2Array()
	for grid_point in grid_path:
		var world_point = _grid_to_world(Vector2i(grid_point.x, grid_point.y))
		_current_path.append(world_point)
	
	if _debug_path_logging:
		print("Calculated Path: ", _current_path)
	queue_redraw()
	return _current_path

func _world_to_grid(pos: Vector2) -> Vector2i:
	var cell_size := _astar.cell_size
	
	# Direct isometric conversion without the quarter-cell offset which was causing issues
	var grid_x = (pos.x / (cell_size.x/2) + pos.y / (cell_size.y/2)) / 2
	var grid_y = (pos.y / (cell_size.y/2) - pos.x / (cell_size.x/2)) / 2
	
	# Find the closest grid center - this is more accurate than just flooring
	return Vector2i(round(grid_x), round(grid_y))

# Convert grid coordinates back to world positions
func _grid_to_world(grid_pos: Vector2i) -> Vector2:
	var cell_size := _astar.cell_size
	
	# Convert grid coordinates to isometric world coordinates (tile centers)
	var world_x = (grid_pos.x - grid_pos.y) * (cell_size.x/2)
	var world_y = (grid_pos.x + grid_pos.y) * (cell_size.y/2)
	
	return Vector2(world_x, world_y)

# Debug function to validate coordinate conversions
func debug_coordinates(world_pos: Vector2) -> void:
	var grid_pos = _world_to_grid(world_pos)
	var reconverted_world = _grid_to_world(grid_pos)
	if _debug_path_logging:
		print("Original world: ", world_pos)
		print("Converted to grid: ", grid_pos)
		print("Back to world: ", reconverted_world)

func get_tile_center(world_pos: Vector2) -> Vector2:
	var grid_pos = _world_to_grid(world_pos)
	return _grid_to_world(grid_pos)

func is_position_valid(pos: Vector2) -> bool:
	var grid_pos := _world_to_grid(pos)
	return _astar.is_in_boundsv(grid_pos)

func get_debug_points() -> Array:
	var points := []
	var region := _astar.region
	for x in range(region.position.x, region.position.x + region.size.x):
		for y in range(region.position.y, region.position.y + region.size.y):
			var grid_pos := Vector2i(x, y)
			# Use _astar.get_point_position for the actual AStar world position
			var world_pos := _astar.get_point_position(grid_pos)
			var is_solid := _astar.is_point_solid(grid_pos)
			points.append({
				"position": world_pos, 
				"solid": is_solid,
				"grid_pos": grid_pos
			})
	return points

func highlight_tile_at(world_pos: Vector2) -> void:
	_click_position = world_pos  # Store the actual click position
	_highlighted_tile = _world_to_grid(world_pos)
	queue_redraw()
	
func _draw() -> void:
	if not _debug_draw:
		return
		
	# Draw the path
	for i in range(_current_path.size() - 1):
		draw_line(_current_path[i], _current_path[i + 1],
				 Color.YELLOW,
				 2.0)
		
	# Draw grid points for debugging
	if _debug_draw:
		var points = get_debug_points()
		for point in points:
			var color = Color.RED if point.solid else Color.GREEN
			draw_circle(point.position, 4.0, color)
			
			# Draw the grid coordinates below each point
			var text = "(%d,%d)" % [point.grid_pos.x, point.grid_pos.y]
			var text_pos = point.position + Vector2(0, 15)
			draw_string(ThemeDB.fallback_font, text_pos, text, HORIZONTAL_ALIGNMENT_CENTER, -1, 24, color)
	
	# Draw highlighted tile
	if _highlighted_tile:
		var tile_center = _astar.get_point_position(_highlighted_tile)
		var size := Vector2(32, 32)
		var rect := Rect2(tile_center - size/2, size)
		draw_rect(rect, Color.ORANGE, false, 2.0)
		
		# Draw a marker at the actual click position to show the difference
		if _click_position:
			draw_circle(_click_position, 6.0, Color.BLUE)
			draw_line(_click_position, tile_center, Color.MAGENTA, 2.0)

# Test function to compare our conversions with AStar's world positions
func debug_coordinate_systems(world_pos: Vector2) -> void:
	var our_grid_pos = _world_to_grid(world_pos)
	var our_world_pos = _grid_to_world(our_grid_pos)
	var astar_world_pos = _astar.get_point_position(our_grid_pos)
	
	if _debug_path_logging:
		print("World Position: ", world_pos)
		print("Our System - Grid: ", our_grid_pos)
		print("Our System - Back to world: ", our_world_pos)
		print("AStar - World position for this grid: ", astar_world_pos)
		
		# Calculate conversion differences
		var our_to_astar_diff = our_world_pos - astar_world_pos
		print("Difference between our world pos and AStar world pos: ", our_to_astar_diff)

# Add this before or after calculate_path:
func get_astar_path(start_pos: Vector2, end_pos: Vector2) -> PackedVector2Array:
	# Let AStar handle all coordinate conversions
	var astar_start = _astar.get_closest_point(start_pos)
	var astar_end = _astar.get_closest_point(end_pos)
	var grid_path = _astar.get_id_path(astar_start, astar_end)
	
	var world_path = PackedVector2Array()
	for grid_point in grid_path:
		world_path.append(_astar.get_point_position(Vector2i(grid_point.x, grid_point.y)))
	
	return world_path

# Add a helper function to get the closest valid grid position
func get_closest_valid_grid_position(pos: Vector2) -> Vector2i:
	var grid_pos = _world_to_grid(pos)
	
	# If the calculated grid position is not valid, find the closest valid one
	if not _astar.is_in_boundsv(grid_pos):
		var closest_distance := INF
		var closest_pos := Vector2i()
		
		# Check surrounding grid cells to find the closest valid one
		for x in range(-1, 2):
			for y in range(-1, 2):
				var test_pos = grid_pos + Vector2i(x, y)
				if _astar.is_in_boundsv(test_pos):
					var world_test_pos = _grid_to_world(test_pos)
					var distance = pos.distance_to(world_test_pos)
					if distance < closest_distance:
						closest_distance = distance
						closest_pos = test_pos
		
		return closest_pos
	
	return grid_pos
