extends Node2D

signal path_calculated(path: PackedVector2Array)
signal pathfinding_progress_updated(info: Dictionary)
signal grid_updated(debug_points: Array)

var _astar := AStar2D.new()
var _current_path: PackedVector2Array
var _cell_size := Vector2(256, 128) # Isometric tile size
var _grid_to_id_map := {} # Dictionary to map grid coordinates to AStar IDs
var _id_to_grid_map := {} # Dictionary to map AStar IDs to grid coordinates
var _map_rect: Rect2i # Store map rectangle for bounds checking
var _grid_offset := Vector2i() # Offset to make all grid coordinates positive
var _wall_detector: Node2D # Wall collision detector reference

@export var _debug_path_logging := false  # Debug flag for controlling path logs

func _ready() -> void:
	# Find the wall detector node in the scene
	_wall_detector = get_node("%Wall-Collision-Detector")
	
	var tilemap: TileMapLayer = get_node("%TileMapLayer-Ground")
	if tilemap:
		_setup_grid(tilemap)
		# Emit debug points after grid is set up
		emit_signal("grid_updated", get_debug_points())
	else:
		push_warning("Tilemap not found. Pathfinding will not work.")

func _compute_cost(from_id: int, to_id: int) -> float:
	var from_grid_pos = _get_grid_pos_from_id(from_id)
	var to_grid_pos = _get_grid_pos_from_id(to_id)
	
	var from_pos = _grid_to_world(from_grid_pos)
	var to_pos = _grid_to_world(to_grid_pos)
	var offset = to_pos - from_pos
	
	# Return 1.0 for orthogonal, 1.4 for diagonal
	return 1.4 if abs(offset.x) > 0 and abs(offset.y) > 0 else 1.0

func _setup_grid(tilemap: TileMapLayer) -> void:
	_map_rect = tilemap.get_used_rect()
	
	# Calculate offset to make all coordinates positive
	_grid_offset = Vector2i(
		abs(_map_rect.position.x) + 1,
		abs(_map_rect.position.y) + 1
	)
	
	if _debug_path_logging:
		print("Setting up AStar2D grid with map rect: ", _map_rect)
		print("Using grid offset: ", _grid_offset)
	
	# Create points for each tile in the grid - expand by 1 in each direction
	for x in range(_map_rect.position.x - 1, _map_rect.position.x + _map_rect.size.x + 1):
		for y in range(_map_rect.position.y - 1, _map_rect.position.y + _map_rect.size.y + 1):
			var grid_pos := Vector2i(x, y)
			var world_pos := _grid_to_world(grid_pos)
			var id := _get_id_from_grid_pos(grid_pos)
			
			# Add point to AStar2D
			_astar.add_point(id, world_pos)
			
			# Store the mapping
			_grid_to_id_map[grid_pos] = id
			_id_to_grid_map[id] = grid_pos
	
	# Connect points that don't have walls between them
	var orthogonal_dirs = [
		Vector2i(0, -1),  # north
		Vector2i(1, 0),   # east
		Vector2i(0, 1),   # south
		Vector2i(-1, 0)   # west
	]
	
	var diagonal_dirs = [
		Vector2i(-1, -1), # northwest
		Vector2i(1, -1),  # northeast
		Vector2i(-1, 1),  # southwest
		Vector2i(1, 1)    # southeast
	]
	
	for grid_pos in _grid_to_id_map:
		var from_id: int = _grid_to_id_map[grid_pos]
		
		# First connect orthogonal neighbors - only if no wall exists
		for dir in orthogonal_dirs:
			var neighbor_pos = grid_pos + dir
			if _grid_to_id_map.has(neighbor_pos):
				var to_id = _grid_to_id_map[neighbor_pos]
				if not _wall_detector.has_wall_between(grid_pos, neighbor_pos):
					if not _astar.are_points_connected(from_id, to_id):
						_astar.connect_points(from_id, to_id, true)
		
		# Then handle diagonal connections - only if no walls block the path
		for diag_dir in diagonal_dirs:
			var neighbor_pos = grid_pos + diag_dir
			
			if _grid_to_id_map.has(neighbor_pos):
				var to_id = _grid_to_id_map[neighbor_pos]
				
					# Check for walls in both orthogonal directions to prevent corner cutting
				var ortho1 = Vector2i(diag_dir.x, 0)
				var ortho2 = Vector2i(0, diag_dir.y)
				
				# Only connect if there are no walls in any direction
				if not _wall_detector.has_wall_between(grid_pos, neighbor_pos) and \
				   not _wall_detector.has_wall_between(grid_pos, grid_pos + ortho1) and \
				   not _wall_detector.has_wall_between(grid_pos + ortho1, neighbor_pos) and \
				   not _wall_detector.has_wall_between(grid_pos, grid_pos + ortho2) and \
				   not _wall_detector.has_wall_between(grid_pos + ortho2, neighbor_pos):
					if not _astar.are_points_connected(from_id, to_id):
						_astar.connect_points(from_id, to_id, true)
	
	# Print debug info
	if _debug_path_logging:
		print("AStar2D setup complete with ", _astar.get_point_count(), " points")
		var test_pos = Vector2(0, 0)
		var grid_pos = _world_to_grid(test_pos)
		print("World (0,0) → Grid: ", grid_pos)
		
		# Check grid to world conversion
		var world_pos = _grid_to_world(grid_pos)
		print("Grid ", grid_pos, " → World: ", world_pos)
		
		# Verify point exists in AStar2D
		if _grid_to_id_map.has(grid_pos):
			var id = _grid_to_id_map[grid_pos]
			var astar_world_pos = _astar.get_point_position(id)
			print("AStar2D world position for grid ", grid_pos, ": ", astar_world_pos)

# Function to convert grid position to a unique ID for AStar2D
func _get_id_from_grid_pos(grid_pos: Vector2i) -> int:
	# Apply offset to make coordinates positive before generating ID
	var offset_pos := grid_pos + _grid_offset
	# Use a simple formula to generate unique IDs from 2D coordinates
	return offset_pos.x * 100000 + offset_pos.y

# Function to convert AStar2D ID back to grid position
func _get_grid_pos_from_id(id: int) -> Vector2i:
	# Convert ID back to offset coordinates
	var offset_y := id % 100000
	var offset_x := id / 100000
	# Remove offset to get original grid position
	return Vector2i(offset_x, offset_y) - _grid_offset

func calculate_path(start_pos: Vector2, end_pos: Vector2) -> PackedVector2Array:
	var start_grid_pos = _world_to_grid(start_pos)
	var end_grid_pos = _world_to_grid(end_pos)
	
	if _debug_path_logging:
		print("Start Grid Position: ", start_grid_pos)
		print("End Grid Position: ", end_grid_pos)
		print("Start World: ", start_pos, " → Grid: ", start_grid_pos, " → Back to World: ", _grid_to_world(start_grid_pos))
		print("End World: ", end_pos, " → Grid: ", end_grid_pos, " → Back to World: ", _grid_to_world(end_grid_pos))
		
		# Debug wall detection
		var wall_exists = _wall_detector.has_wall_between(start_grid_pos, end_grid_pos)
		print("Wall between start and end: ", wall_exists)
	
	# Get the AStar IDs for start and end positions
	var start_id = _get_closest_point_id(start_grid_pos)
	var end_id = _get_closest_point_id(end_grid_pos)
	
	if _debug_path_logging:
		print("Start ID: ", start_id)
		print("End ID: ", end_id)
	
	if start_id == -1 or end_id == -1:
		if _debug_path_logging:
			print("Invalid start or end position for pathfinding")
		return PackedVector2Array()
	
	# Get the path as AStar IDs
	var id_path = _astar.get_id_path(start_id, end_id)
	
	if _debug_path_logging:
		print("Found path with IDs: ", id_path)
	
	# Convert path to world positions
	_current_path = PackedVector2Array()
	for id in id_path:
		_current_path.append(_astar.get_point_position(id))
	
	if _debug_path_logging:
		print("Path segments wall check:")
		if id_path.size() > 1:
			for i in range(id_path.size() - 1):
				var from_grid = _get_grid_pos_from_id(id_path[i])
				var to_grid = _get_grid_pos_from_id(id_path[i + 1])
				var has_wall = _wall_detector.has_wall_between(from_grid, to_grid)
				print("Segment ", i, ": ", from_grid, " → ", to_grid, " Wall: ", has_wall)
		print("Final path grid positions:")
		for point in _current_path:
			print(_world_to_grid(point))
	
	# Emit signals
	emit_signal("path_calculated", _current_path)
	emit_signal("pathfinding_progress_updated", {
		"path_length": _current_path.size(),
		"start_id": start_id,
		"end_id": end_id,
		"visited_nodes": id_path.size(),
		"start_grid_pos": start_grid_pos,
		"end_grid_pos": end_grid_pos,
		"tile_center_position": _grid_to_world(end_grid_pos),
	})
	
	return _current_path

func _get_closest_point_id(grid_pos: Vector2i) -> int:
	# Check if the exact grid position exists
	if _grid_to_id_map.has(grid_pos):
		return _grid_to_id_map[grid_pos]
	
	# If not, find the closest valid point
	var world_pos = _grid_to_world(grid_pos)
	var closest_id = _astar.get_closest_point(world_pos)
	
	if _debug_path_logging and closest_id != -1:
		var closest_grid = _get_grid_pos_from_id(closest_id)
		print("Closest point for grid ", grid_pos, " is grid ", closest_grid, 
			" (ID: ", closest_id, ")")
	
	return closest_id

func _world_to_grid(pos: Vector2) -> Vector2i:
	# Use TileMapLayer's conversion for consistency
	var tilemap: TileMapLayer = get_node("%TileMapLayer-Ground")
	return tilemap.local_to_map(pos) if tilemap else Vector2i()

func _grid_to_world(grid_pos: Vector2i) -> Vector2:
	# Use TileMapLayer's conversion for consistency
	var tilemap: TileMapLayer = get_node("%TileMapLayer-Ground")
	return tilemap.map_to_local(grid_pos) if tilemap else Vector2()

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
	return _map_rect.has_point(grid_pos)

func get_debug_points() -> Array:
	var points := []
	for id in _astar.get_point_ids():
		var grid_pos := _get_grid_pos_from_id(id)
		var world_pos := _astar.get_point_position(id)
		
		points.append({
			"position": world_pos,
			"solid": false, # We don't have solid points yet
			"grid_pos": grid_pos,
			"id": id
		})
	return points

# Get AStar path using AStar2D's API directly
func get_astar_path(start_pos: Vector2, end_pos: Vector2) -> PackedVector2Array:
	var closest_start_id = _astar.get_closest_point(start_pos)
	var closest_end_id = _astar.get_closest_point(end_pos)
	
	var id_path = _astar.get_id_path(closest_start_id, closest_end_id)
	var world_path = PackedVector2Array()
	
	for id in id_path:
		world_path.append(_astar.get_point_position(id))
	
	return world_path

# Get the closest valid grid position
func get_closest_valid_grid_position(pos: Vector2) -> Vector2i:
	var grid_pos = _world_to_grid(pos)
	
	# If the calculated grid position is not valid, find the closest valid one
	if not _map_rect.has_point(grid_pos):
		var closest_distance := INF
		var closest_pos := Vector2i()
		
		# Check surrounding grid cells to find the closest valid one
		for x in range(-1, 2):
			for y in range(-1, 2):
				var test_pos = grid_pos + Vector2i(x, y)
				if _map_rect.has_point(test_pos):
					var world_test_pos = _grid_to_world(test_pos)
					var distance = pos.distance_to(world_test_pos)
					if distance < closest_distance:
						closest_distance = distance
						closest_pos = test_pos
		
		return closest_pos
	
	return grid_pos

# Debug function to compare our conversions with AStar2D's positions
func debug_coordinate_systems(world_pos: Vector2) -> void:
	var our_grid_pos = _world_to_grid(world_pos)
	var our_world_pos = _grid_to_world(our_grid_pos)
	
	if _grid_to_id_map.has(our_grid_pos):
		var id = _grid_to_id_map[our_grid_pos]
		var astar_world_pos = _astar.get_point_position(id)
		
		if _debug_path_logging:
			print("World Position: ", world_pos)
			print("Our System - Grid: ", our_grid_pos)
			print("Our System - Back to world: ", our_world_pos)
			print("AStar2D - World position for this grid: ", astar_world_pos)
			
			# Calculate conversion differences
			var our_to_astar_diff = our_world_pos - astar_world_pos
			print("Difference between our world pos and AStar2D world pos: ", our_to_astar_diff)

# Debug validation function to compare with TileMapLayer
func validate_coordinate_systems(world_pos: Vector2) -> bool:
	var tilemap: TileMapLayer = get_node("%TileMapLayer-Ground")
	if not tilemap:
		return false
		
	var tilemap_grid = tilemap.local_to_map(world_pos)
	var astar_grid = _world_to_grid(world_pos)
	
	if _debug_path_logging:
		print("Validating coordinates:")
		print("World position: ", world_pos)
		print("TileMapLayer grid: ", tilemap_grid)
		print("AStar grid: ", astar_grid)
		print("Match: ", tilemap_grid == astar_grid)
	
	return tilemap_grid == astar_grid
