extends Node2D

var _astar := AStarGrid2D.new()
var _current_path: PackedVector2Array
@export var _debug_draw := false:
	set(value):
		_debug_draw = value
		queue_redraw()

var _highlighted_tile: Vector2i

func _ready() -> void:
	var tilemap : TileMapLayer = get_node("%TileMapLayer-Ground")
	if tilemap:
		_setup_grid(tilemap)
	else:
		push_warning("Tilemap not found. Pathfinding will not work.")

func _setup_grid(tilemap: TileMapLayer) -> void:
	var map_rect: Rect2i = tilemap.get_used_rect()
	
	_astar.cell_size = Vector2(256, 128) # Isometric tile size
	_astar.offset = Vector2.ZERO 
	_astar.region = map_rect
	_astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_ALWAYS
	_astar.cell_shape = AStarGrid2D.CELL_SHAPE_ISOMETRIC_DOWN
	_astar.update()

func calculate_path(start_pos: Vector2, end_pos: Vector2) -> PackedVector2Array:
	var start_grid_pos = _world_to_grid(start_pos)
	var end_grid_pos = _world_to_grid(end_pos)
	print("Start Grid Position: ", start_grid_pos)
	print("End Grid Position: ", end_grid_pos)
	
	# Get path in grid coordinates
	var grid_path = _astar.get_id_path(start_grid_pos, end_grid_pos)
	
	# Convert grid path to world positions with proper tile center adjustment
	_current_path = PackedVector2Array()
	for grid_point in grid_path:
		var world_point = _grid_to_world(Vector2i(grid_point.x, grid_point.y))
		_current_path.append(world_point)
	
	print("Calculated Path: ", _current_path)
	queue_redraw()
	return _current_path

func _world_to_grid(pos: Vector2) -> Vector2i:
	var cell_size := _astar.cell_size
	
	# Convert isometric world coordinates to grid coordinates
	# Formula for isometric projection
	var grid_x = (pos.x / (cell_size.x/2) + pos.y / (cell_size.y/2)) / 2
	var grid_y = (pos.y / (cell_size.y/2) - pos.x / (cell_size.x/2)) / 2
	
	return Vector2i(floor(grid_x), floor(grid_y))

# Convert grid coordinates back to world positions
func _grid_to_world(grid_pos: Vector2i) -> Vector2:
	var cell_size := _astar.cell_size
	
	# Convert grid coordinates to isometric world coordinates
	var world_x = (grid_pos.x - grid_pos.y) * (cell_size.x/2)
	var world_y = (grid_pos.x + grid_pos.y) * (cell_size.y/2)
	
	return Vector2(world_x, world_y)

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
			var world_pos := _astar.get_point_position(grid_pos)
			var is_solid := _astar.is_point_solid(grid_pos)
			points.append({"position": world_pos, "solid": is_solid})
	return points

func highlight_tile_at(world_pos: Vector2) -> void:
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
	
	# Draw highlighted tile
	if _highlighted_tile:
		var tile_center = _astar.get_point_position(_highlighted_tile)
		var size := Vector2(32, 32)
		var rect := Rect2(tile_center - size/2, size)
		draw_rect(rect, Color.ORANGE, false, 2.0)
