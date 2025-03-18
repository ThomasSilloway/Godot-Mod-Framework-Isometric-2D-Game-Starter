extends GutTest

var _test_scene
var _navigation
var _util_grid
var _character_controller
var _wait_frames := 120  # About 2 seconds at 60 fps

func before_all():
	gut.p("Testing non-grid AStar2D navigation system")

func before_each():
	_test_scene = preload("res://isometric_2d_prototype/test_navigation_collision_scene.tscn").instantiate()
	add_child_autofree(_test_scene)
	_navigation = _test_scene.get_node("%Isometric-Navigation")
	_util_grid = _test_scene.get_node("%Util-Grid")
	
	# Enable debug path logging for this test
	_navigation._debug_path_logging = true
	
	_character_controller = _test_scene.get_node("Tilemap/YSortables/Character-Male-Kenny")
	assert_not_null(_character_controller, "Character controller should be found")
	assert_not_null(_navigation, "Navigation should be found")

func test_move_character_to_position():
	var error := OK
	
	if not _character_controller or not _navigation:
		push_error("Required nodes not found")
		error = ERR_DOES_NOT_EXIST
		assert_eq(error, OK, "Required nodes should exist")
		return
	
	# Player starts at world coordinate 0,0 (grid position 0,0)
	assert_eq(_character_controller.global_position, Vector2(0, 0), "Character should start at origin")
	
	# Target grid position is (2, -4)
	var target_grid_pos := Vector2i(2, -4)
	# Convert grid position to world position manually
	# For isometric grid: 
	# x = (grid_x - grid_y) * (tile_width / 2)
	# y = (grid_x + grid_y) * (tile_height / 2)
	var tile_width := 256
	var tile_height := 128
	var target_world_pos : Vector2 = _util_grid.grid_to_world(target_grid_pos)
	
	if not _navigation.is_position_valid(target_world_pos):
		push_error("Target position is outside navigation bounds")
		error = ERR_INVALID_PARAMETER
		assert_eq(error, OK, "Target position should be within bounds")
		return
	
	# Trigger movement to the target position
	_character_controller._on_mouse_click(target_world_pos)
	
	# Wait for the character to move
	await wait_frames(_wait_frames, "Waiting for character to finish moving")
	
	# Verify the character arrived at the target position (with some margin for error)
	var distance: float = _character_controller.global_position.distance_to(target_world_pos)
	if distance >= _character_controller.arrival_threshold * 2:
		push_error("Character did not arrive at target position. Distance: %f" % distance)
		error = ERR_INVALID_DATA
	assert_eq(error, OK, "Character should arrive at target position")
	
	# Check if the character's path was cleared after arrival
	if not _character_controller._current_path.is_empty():
		push_error("Path was not cleared after arrival")
		error = ERR_INVALID_DATA
	assert_eq(error, OK, "Current path should be empty after reaching destination")
