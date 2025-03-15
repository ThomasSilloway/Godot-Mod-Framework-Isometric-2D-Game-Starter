extends Node2D

enum CoordinateSystemMode {
	BOTH = 0,
	TILEMAP = 1,
	ASTAR = 2
}

# Path visualization settings
@export var _debug_draw := true:
	set(value):
		_debug_draw = value
		queue_redraw()
@export var _debug_show_coordinates := false
@export var _debug_show_connections := false
@export var _debug_show_walls := true
@export var _debug_coordinate_system: CoordinateSystemMode = CoordinateSystemMode.BOTH

# Colors for different coordinate systems
const TILEMAP_COLOR := Color.GREEN
const ASTAR_COLOR := Color.YELLOW
const BOTH_SYSTEMS_COLOR := Color.WHITE

# Store data from A* navigation system
var _current_path: PackedVector2Array
var _click_positions: Array[Vector2] = []
var _highlighted_tile: Vector2i
var _click_position: Vector2  # Store the actual click position
var _debug_points: Array = []
var _pathfinding_info: Dictionary = {}
var _navigation: Node2D
var _wall_detector: Node2D

func _ready() -> void:
	# Look for the navigation node and connect to its signals
	_navigation = get_node("%Isometric-Navigation")
	if _navigation:
		_navigation.path_calculated.connect(_on_path_calculated)
		_navigation.pathfinding_progress_updated.connect(_on_pathfinding_progress_updated)
		_navigation.grid_updated.connect(_on_grid_updated)
		
		# Get initial debug points for visualization
		_debug_points = _navigation.get_debug_points()
		_wall_detector = get_node("%Wall-Collision-Detector")
		queue_redraw()  # Ensure we draw the points immediately

# Signal handlers
func _on_path_calculated(path: PackedVector2Array) -> void:
	_current_path = path
	queue_redraw()

func _on_pathfinding_progress_updated(info: Dictionary) -> void:
	_pathfinding_info = info
	queue_redraw()

func _on_grid_updated(points: Array) -> void:
	_debug_points = points
	queue_redraw()

# Add click position for visualization
func add_click_position(pos: Vector2) -> void:
	_click_positions.append(pos)
	queue_redraw()

# Set debug points from navigation system
func set_debug_points(points: Array) -> void:
	_debug_points = points
	queue_redraw()

# Clear all stored click positions
func clear_click_positions() -> void:
	_click_positions.clear()
	queue_redraw()

# Highlight a specific tile
func highlight_tile_at(world_pos: Vector2, tile_pos: Vector2i) -> void:
	_click_position = world_pos  # Store the actual click position
	_highlighted_tile = tile_pos
	queue_redraw()

# Draw debug information
func _draw() -> void:
	if not _debug_draw:
		return
	
	# Draw the path
	for i in range(_current_path.size() - 1):
		draw_line(_current_path[i], _current_path[i + 1],
				 Color.YELLOW,
				 2.0)
	
	# Choose color based on coordinate system display mode
	var point_color = BOTH_SYSTEMS_COLOR
	if _debug_coordinate_system == CoordinateSystemMode.TILEMAP:  # TileMap only
		point_color = TILEMAP_COLOR
	elif _debug_coordinate_system == CoordinateSystemMode.ASTAR:  # AStar only
		point_color = ASTAR_COLOR
	
	# Draw grid points for debugging
	for point in _debug_points:
		var pos = point.position
		var grid_pos = point.grid_pos
		
		# Draw the point
		draw_circle(pos, 4.0, point_color)
		
		# Draw the grid coordinates below each point if enabled
		if _debug_show_coordinates and "grid_pos" in point:
			var text = "(%d,%d)" % [grid_pos.x, grid_pos.y]
			var text_pos = pos + Vector2(0, 15)
			draw_string(ThemeDB.fallback_font, text_pos, text, HORIZONTAL_ALIGNMENT_CENTER, -1, 24, point_color)
		
		# Draw walls if enabled
		if _debug_show_walls and _wall_detector and "grid_pos" in point:
			var directions = [
				Vector2i(1, 0),   # east
				Vector2i(-1, 0),  # west
				Vector2i(0, -1),  # north
				Vector2i(0, 1),   # south
			]
			
			for dir in directions:
				var neighbor_pos = grid_pos + dir
				if _wall_detector.has_wall_between(grid_pos, neighbor_pos):
					var neighbor_world = _navigation._grid_to_world(neighbor_pos)
					draw_line(pos, neighbor_world, Color.RED, 3.0)
		
		# Draw connections between points if enabled
		if _debug_show_connections and "id" in point and _navigation:
			var astar = _navigation._astar
			var from_id = point.id
			
			for to_id in astar.get_point_ids():
				if astar.are_points_connected(from_id, to_id):
					var to_pos = astar.get_point_position(to_id)
					var connection_color = point_color
					connection_color.a = 0.2  # Make connections semi-transparent
					draw_line(pos, to_pos, connection_color, 1.0)
	
	# Draw click positions
	for pos in _click_positions:
		var size := Vector2(10, 10)
		var rect := Rect2(pos - size/2, size)
		draw_rect(rect, Color.RED, false)
	
	# Draw highlighted tile
	if _highlighted_tile:
		var tile_center = _pathfinding_info.get("tile_center_position", Vector2.ZERO)
		if tile_center == Vector2.ZERO and _debug_points.size() > 0:
			# Try to find the tile center from debug points if available
			for point in _debug_points:
				if "grid_pos" in point and point.grid_pos == _highlighted_tile:
					tile_center = point.position
					break
		
		if tile_center != Vector2.ZERO:
			var size := Vector2(32, 32)
			var rect := Rect2(tile_center - size/2, size)
			draw_rect(rect, Color.ORANGE, false, 2.0)
			
			# Draw a marker at the actual click position to show the difference
			if _click_position:
				draw_circle(_click_position, 6.0, Color.BLUE)
				draw_line(_click_position, tile_center, Color.MAGENTA, 2.0)
	
	# Draw pathfinding info
	if not _pathfinding_info.is_empty():
		var text = "Path length: %d" % _pathfinding_info.get("path_length", 0)
		draw_string(ThemeDB.fallback_font, Vector2(10, 20), text, HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color.WHITE)
	
	# Draw coordinate system mode indicator
	var mode_text = "Coordinate System: "
	match _debug_coordinate_system:
		CoordinateSystemMode.BOTH: mode_text += "Both"
		CoordinateSystemMode.TILEMAP: mode_text += "TileMap"
		CoordinateSystemMode.ASTAR: mode_text += "AStar"
	draw_string(ThemeDB.fallback_font, Vector2(10, 40), mode_text,
		HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color.WHITE)

# Toggle coordinate system display mode
func toggle_coordinate_system() -> void:
	_debug_coordinate_system = (_debug_coordinate_system + 1) % 3
	queue_redraw()
