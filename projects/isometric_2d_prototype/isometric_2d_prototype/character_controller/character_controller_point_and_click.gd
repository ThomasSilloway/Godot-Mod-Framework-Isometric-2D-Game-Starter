extends CharacterBody2D

signal direction_changed(direction: Vector2)

@export var speed := 200.0
@export var arrival_threshold := 5.0

var _current_path: PackedVector2Array
var _moving := false
var _current_path_index := 0
var _last_click_pos: Vector2  # New variable

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var target_pos := get_global_mouse_position()
		print("\nClick Information:")
		print("World Click Position: ", target_pos)
		
		var navigation = get_node("%Isometric-Navigation")
		if navigation:
			var tile_coord = navigation._world_to_grid(target_pos)
			var tile_center = navigation.get_tile_center(target_pos)
			print("Selected Tile Coordinate: ", tile_coord)
			print("Selected Tile World Position: ", tile_center)
			navigation.highlight_tile_at(target_pos)
			
			# Store the click position for debugging
			_last_click_pos = target_pos
			
		var debug_draw = get_node("%World-Draw-Debug")
		if debug_draw:
			debug_draw.add_click_position(target_pos)
			
		_set_target_position(target_pos)

func _physics_process(delta: float) -> void:
	if not _moving or _current_path.is_empty():
		return
		
	var next_point := _current_path[_current_path_index]
	var direction := (next_point - global_position).normalized()
	
	# Move towards the next point
	velocity = direction * speed * delta * 1000
	move_and_slide()
	
	# Emit signal for animation updates
	direction_changed.emit(direction)
	
	# Check if we've reached the next point
	var distance_to_next_point := global_position.distance_to(next_point)
	print("Distance to next point: ", distance_to_next_point, " Point: ", next_point)
	
	if distance_to_next_point < arrival_threshold:
		global_position = next_point  # Set exact position when arriving
		_current_path_index += 1
		print("Moving to next path point: ", _current_path_index, "/", _current_path.size())
		if _current_path_index >= _current_path.size():
			_moving = false
			velocity = Vector2.ZERO
			direction_changed.emit(Vector2.ZERO)
			print("Path finished! Final position: ", global_position)
			_current_path.clear()
			_current_path_index = 0

func _set_target_position(target_pos: Vector2) -> void:
	# print("Setting target position to: ", target_pos)
	var navigation = get_node("%Isometric-Navigation")
	if not navigation:
		push_warning("Navigation node not found")
		return
	
	_current_path = navigation.calculate_path(global_position, target_pos)
	#print properties of _current_path
	print("Current Path: ", _current_path)
	if not _current_path.is_empty():
		_moving = true
		_current_path_index = 0
