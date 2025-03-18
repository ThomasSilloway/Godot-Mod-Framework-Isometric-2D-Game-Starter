extends GutTest

var _scene: Node2D
var _tilemap: TileMapLayer
var _a_star: Node2D
var _util_grid: UtilGrid

func before_each():
	# Load the test scene
	_scene = load("res://isometric_2d_prototype/test_navigation_collision_scene.tscn").instantiate()
	add_child_autofree(_scene, true)
	
	# Get references to key nodes
	_tilemap = _scene.get_node("%TileMapLayer-Ground")
	_a_star = _scene.get_node("%Isometric-Navigation")
	
	# Create an instance of the UtilGrid class
	_util_grid = _scene.get_node("%Util-Grid")
	
	assert_not_null(_tilemap, "TileMap node should exist")
	assert_not_null(_a_star, "A* navigation node should exist")
	assert_not_null(_util_grid, "UtilGrid node should exist")
	
	# Wait one frame to ensure scene is fully initialized
	await get_tree().process_frame

func test_world_to_grid_conversion():
	# Test world to grid conversion for various coordinates
	var test_positions = [
		Vector2(0, 0),      # Origin
		Vector2(128, 64),   # Half tile right
		Vector2(-128, -64), # Half tile left
		Vector2(256, 128),  # Full tile right
		Vector2(0, 128)     # Full tile down
	]
	
	for world_pos in test_positions:
		# Compare with the original TileMap conversion for consistency
		var tilemap_grid = _tilemap.local_to_map(world_pos)
		var util_grid = _util_grid.world_to_grid(world_pos)
		
		assert_eq(util_grid, tilemap_grid, 
			"UtilGrid should convert world to grid consistently with TileMap for position %s" % world_pos)

func test_grid_to_world_conversion():
	# Test grid to world conversion for various coordinates
	var test_grid_positions = [
		Vector2i(-1, 0),    # Origin grid
		Vector2i(0, 0),     # One tile right-up
		Vector2i(-2, -1),   # One tile left-up
		Vector2i(1, 1),     # Bottom right
		Vector2i(-1, 1)     # Bottom 
	]
	
	for grid_pos in test_grid_positions:
		# Compare with the original TileMap conversion for consistency
		var tilemap_world = _tilemap.map_to_local(grid_pos)
		var util_world = _util_grid.grid_to_world(grid_pos)
		
		assert_almost_eq(util_world.x, tilemap_world.x, 0.001,
			"UtilGrid should convert grid to world X correctly for position %s" % grid_pos)
		assert_almost_eq(util_world.y, tilemap_world.y, 0.001,
			"UtilGrid should convert grid to world Y correctly for position %s" % grid_pos)

func test_round_trip_conversion():
	# Test that converting from world to grid and back preserves positions
	var test_positions = [
		Vector2(0, 0),        # Origin
		Vector2(128, 64),     # Half tile right
		Vector2(-128, -64),   # Half tile left
		Vector2(256, 128),    # Full tile right
		Vector2(-256, -128)   # Full tile left
	]
	
	for original_world_pos in test_positions:
		var grid_pos = _util_grid.world_to_grid(original_world_pos)
		var converted_world_pos = _util_grid.grid_to_world(grid_pos)
		
		# The tile center position should be close to the original if it was centered,
		# or to the center of the tile containing the original position
		var expected_world_pos = _tilemap.map_to_local(_tilemap.local_to_map(original_world_pos))
		
		assert_almost_eq(converted_world_pos.x, expected_world_pos.x, 0.001,
			"Round-trip conversion should preserve X position for %s" % original_world_pos)
		assert_almost_eq(converted_world_pos.y, expected_world_pos.y, 0.001,
			"Round-trip conversion should preserve Y position for %s" % original_world_pos)

func test_get_tile_center():
	# Test that get_tile_center returns the center position of the tile
	var test_positions = [
		Vector2(10, 10),    # Off-center position
		Vector2(128, 75),   # Near center of a tile
		Vector2(-150, -60)  # Negative coordinates
	]
	
	for pos in test_positions:
		var tile_center = _util_grid.get_tile_center(pos)
		
		# The tile center should match what we get from converting to grid and back
		var expected_center = _tilemap.map_to_local(_tilemap.local_to_map(pos))
		
		assert_almost_eq(tile_center.x, expected_center.x, 0.001,
			"get_tile_center should return correct X center for position %s" % pos)
		assert_almost_eq(tile_center.y, expected_center.y, 0.001,
			"get_tile_center should return correct Y center for position %s" % pos)

func test_closest_valid_grid_position():
	# Assuming the map rectangle is properly set up in the navigation system
	# We should test that get_closest_valid_grid_position returns valid positions
	
	# This test assumes the navigation map is set up with certain boundaries
	# Create a position that's outside the expected boundary
	var far_outside_pos = Vector2(10000, 10000)
	var closest_valid_grid = _util_grid.get_closest_valid_grid_position(far_outside_pos)
	
	# We can't know exactly what the closest valid position is without knowing the map boundaries
	# But we can verify that the returned position is within some reasonable range
	var world_pos = _util_grid.grid_to_world(closest_valid_grid)
	
	# The converted position should be within the bounds of the test map
	assert_gt(world_pos.length(), 0, 
		"Closest valid position should be a real position")
	assert_lt(world_pos.length(), 5000, 
		"Closest valid position should be within reasonable distance of map")
	
	# For a position already in bounds, it should return the same grid position
	var in_bounds_pos = Vector2(0, 0)  # Origin should be in bounds for test scene
	var in_bounds_grid = _util_grid.world_to_grid(in_bounds_pos)
	var closest_in_bounds = _util_grid.get_closest_valid_grid_position(in_bounds_pos)
	
	assert_eq(closest_in_bounds, in_bounds_grid,
		"For position already in bounds, should return the same grid position")