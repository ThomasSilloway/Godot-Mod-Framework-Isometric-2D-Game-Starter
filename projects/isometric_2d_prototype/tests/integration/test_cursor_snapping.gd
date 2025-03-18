extends GutTest

var _test_scene
var _cursor
var _util_grid
var _wait_frames := 5  # Just a few frames should be enough for cursor updates

func before_all():
	gut.p("Testing cursor snapping to grid functionality")

func before_each():
	# Load the test scene
	_test_scene = preload("res://isometric_2d_prototype/test_navigation_collision_scene.tscn").instantiate()
	add_child_autofree(_test_scene)
	
	# Get references to key nodes
	_cursor = _test_scene.get_node("%Cursor")
	_util_grid = _test_scene.get_node("%Util-Grid")
	
	assert_not_null(_cursor, "Cursor node should be found")
	assert_not_null(_util_grid, "Util-Grid node should be found")
	
	# Wait a frame to ensure the cursor is initialized
	await get_tree().process_frame

func test_cursor_snaps_to_grid():
	# Test that cursor is already snapped to a grid position
	var cursor_pos = _cursor.global_position
	var snapped_pos = _util_grid.get_tile_center(cursor_pos)
	assert_eq(cursor_pos, snapped_pos, "Cursor should be snapped to grid at startup")
	
	# Move the mouse to a specific position
	var test_mouse_pos = Vector2(150, 75)  # Some arbitrary position
	Input.warp_mouse(_test_scene.get_viewport().get_screen_transform() * test_mouse_pos)
	
	# Wait a few frames for the cursor to update
	await wait_frames(_wait_frames, "Waiting for cursor to update")
	
	# Check that cursor has snapped to the nearest grid position
	cursor_pos = _cursor.global_position
	snapped_pos = _util_grid.get_tile_center(_cursor.get_global_mouse_position())
	assert_eq(cursor_pos, snapped_pos, "Cursor should snap to the nearest grid position")

func test_cursor_follows_mouse():
	# Test multiple mouse positions to ensure cursor follows properly
	var test_positions = [
		Vector2(100, 50),
		Vector2(200, 100),
		Vector2(300, 150)
	]
	
	for pos in test_positions:
		# Move the mouse
		Input.warp_mouse(_test_scene.get_viewport().get_screen_transform() * pos)
		
		# Wait for cursor to update
		await wait_frames(_wait_frames, "Waiting for cursor to update")
		
		# Verify cursor position is snapped to grid
		var cursor_pos = _cursor.global_position
		var expected_pos = _util_grid.get_tile_center(_cursor.get_global_mouse_position())
		assert_eq(cursor_pos, expected_pos, "Cursor should snap to grid at position %s" % pos)
