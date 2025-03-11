extends Node2D

var _astar := AStarGrid2D.new()
var _current_path: PackedVector2Array
@export var _debug_draw := false:
	set(value):
		_debug_draw = value
		queue_redraw()

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
	_current_path = _astar.get_point_path(_world_to_grid(start_pos), _world_to_grid(end_pos))
	queue_redraw()
	return _current_path

func _world_to_grid(pos: Vector2) -> Vector2i:
	var cell_size := _astar.cell_size
	var grid_pos := Vector2i()
	
	# Convert isometric world coordinates to grid coordinates
	var local_x := pos.x
	var local_y := pos.y
	
	# Convert to grid coordinates
	grid_pos.x = floor((local_x / cell_size.x + local_y / cell_size.y) / 2.0)
	grid_pos.y = floor((local_y / cell_size.y - local_x / cell_size.x) / 2.0)
	
	return grid_pos

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

func _draw() -> void:
	if not _debug_draw: # or _current_path.is_empty():
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
