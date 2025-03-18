class_name Cursor
extends Node2D

# Reference to the util_grid for coordinate conversions
var _util_grid: UtilGrid

# Track if the cursor has been properly initialized
var _initialized: bool = false

func _ready() -> void:
	# Get reference to the util_grid
	_util_grid = get_node("%Util-Grid")
	if not _util_grid:
		push_error("Cursor: UtilGrid node not found. Cursor snapping will not work correctly.")
		return
	
	# Set initial position based on mouse position
	_initialize_position()
	_initialized = true

func _process(_delta: float) -> void:
	if not _initialized:
		return
	
	# Get the current mouse position in the game world
	var mouse_pos = get_global_mouse_position()
	
	# Snap the cursor to the nearest tile center
	var snap_pos = _util_grid.get_tile_center(mouse_pos)
	
	# Update the cursor position
	global_position = snap_pos

func _initialize_position() -> void:
	# Initialize cursor position at mouse position
	var mouse_pos = get_global_mouse_position()
	var snap_pos = _util_grid.get_tile_center(mouse_pos)
	global_position = snap_pos