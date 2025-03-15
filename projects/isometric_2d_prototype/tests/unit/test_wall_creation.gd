extends GutTest

var _scene: Node2D
var _wall_detector: Node2D
var _a_star: Node2D

func before_each():
	# Load the test scene
	_scene = load("res://isometric_2d_prototype/test_navigation_collision_scene.tscn").instantiate()
	add_child_autofree(_scene, true) # true means don't queue_free on success
	
	# Get references to key nodes
	_wall_detector = _scene.get_node("%Wall-Collision-Detector")
	_a_star = _scene.get_node("%Isometric-Navigation")
	
	assert_not_null(_wall_detector, "Wall detector node should exist")
	assert_not_null(_a_star, "A* navigation node should exist")
	
	# Clear wall detection cache before each test
	_wall_detector.clear_cache()
	# Wait one frame to ensure scene is fully initialized
	await get_tree().process_frame

func test_wall_detector_setup():
	assert_true(_wall_detector != null, "Wall detector should be initialized")
	assert_true(_wall_detector.has_method("has_wall_between"), "Wall detector should have wall detection method")

func test_south_walls():
	# Test south-facing walls at grid positions
	var test_positions = [
		{"start": Vector2i(-1, 0), "end": Vector2i(-1, -1)},
		{"start": Vector2i(0, 0), "end": Vector2i(0, -1)},
		{"start": Vector2i(1, 0), "end": Vector2i(1, -1)}
	]
	
	for pos in test_positions:
		assert_true(
			_wall_detector.has_wall_between(pos.start, pos.end),
			"South wall should exist between %s and %s" % [pos.start, pos.end]
		)
	
	# Verify no walls where they shouldn't be
	assert_false(
		_wall_detector.has_wall_between(Vector2i(-2, 0), Vector2i(-2, 1)),
		"No wall should exist between (-2,0) and (-2,1)"
	)
	assert_false(
		_wall_detector.has_wall_between(Vector2i(2, 0), Vector2i(2, 1)),
		"No wall should exist between (2,0) and (2,1)"
	)

func test_west_walls():
	# Test west-facing walls
	var test_positions = [
		{"start": Vector2i(-2, -1), "end": Vector2i(-1, -1)},
		{"start": Vector2i(-2, -2), "end": Vector2i(-1, -2)},
		{"start": Vector2i(-2, -3), "end": Vector2i(-1, -3)}
	]
	
	for pos in test_positions:
		assert_true(
			_wall_detector.has_wall_between(pos.start, pos.end),
			"West wall should exist between %s and %s" % [pos.start, pos.end]
		)
	
	# Verify no walls where they shouldn't be
	assert_false(
		_wall_detector.has_wall_between(Vector2i(-1, 0), Vector2i(-2, 0)),
		"No wall should exist between (-1,0) and (-2,0)"
	)
	assert_false(
		_wall_detector.has_wall_between(Vector2i(-1, -4), Vector2i(-2, -4)),
		"No wall should exist between (-1,-4) and (-2,-4)"
	)

func test_wall_impact_on_pathfinding():
	# Test pathfinding with south wall
	var start_pos = _a_star._grid_to_world(Vector2i(-1, 0))  # Updated from 0,0
	var end_pos = _a_star._grid_to_world(Vector2i(-1, -1))   # Updated to match
	var path = _a_star.calculate_path(start_pos, end_pos)
	
	assert_gt(path.size(), 0, "Path should have at least one point")
	var start_grid = _a_star._world_to_grid(path[0])
	var end_grid = _a_star._world_to_grid(path[-1])
	# Test if path follows expected route around walls
	var expected_points = [
		Vector2i(-1, 0),
		Vector2i(0, 0),
		Vector2i(1, 0),
		Vector2i(2, 0),
		Vector2i(2, -1),
		Vector2i(1, -1),
		Vector2i(0, -1),
		Vector2i(-1, -1)
	]
	
	var path_points = []
	for point in path:
		path_points.append(_a_star._world_to_grid(point))
	
	assert_eq(
		path_points,
		expected_points,
		"Path should follow route around the walls with correct grid positions"
	)
	
	# Test pathfinding with west wall
	start_pos = _a_star._grid_to_world(Vector2i(-1, -1))  # Updated to match new coordinate system
	end_pos = _a_star._grid_to_world(Vector2i(-2, -1))    # Updated to match
	path = _a_star.calculate_path(start_pos, end_pos)
	
	assert_gt(path.size(), 0, "Path should have at least one point")
	start_grid = _a_star._world_to_grid(path[0])
	end_grid = _a_star._world_to_grid(path[-1])
	# Test if path follows expected route around walls
	expected_points = [
		Vector2i(-1, -1),
		Vector2i(-1, -2),
		Vector2i(-1, -3),
		Vector2i(-1, -4),
		Vector2i(-2, -4),
		Vector2i(-2, -3),
		Vector2i(-2, -2),
		Vector2i(-2, -1)
	]
	
	path_points = []
	for point in path:
		path_points.append(_a_star._world_to_grid(point))
	
	assert_eq(
		path_points,
		expected_points,
		"Path should follow route around the west wall with correct grid positions"
	)
