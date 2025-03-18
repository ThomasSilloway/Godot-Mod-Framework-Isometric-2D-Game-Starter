extends GutTest

var _scene: Node2D
var _tilemap: TileMapLayer
var _a_star: Node2D
var _util_grid: UtilGrid
var _character: Node2D

func before_each():
	# Load the test scene
	_scene = load("res://isometric_2d_prototype/test_navigation_collision_scene.tscn").instantiate()
	add_child_autofree(_scene, true)
	
	# Get references to key nodes
	_tilemap = _scene.get_node("%TileMapLayer-Ground")
	_a_star = _scene.get_node("%Isometric-Navigation")
	_character = _scene.get_node_or_null("%Character-Male-Kenny")
	
	# Get reference to the grid utility
	_util_grid = _scene.get_node("%Util-Grid")
	
	assert_not_null(_tilemap, "TileMap node should exist")
	assert_not_null(_a_star, "A* navigation node should exist")
	assert_not_null(_character, "Character node should exist")
	assert_not_null(_util_grid, "UtilGrid node should exist")
	
	# Wait one frame to ensure scene is fully initialized
	await get_tree().process_frame

func test_world_origin_mapping():
	# Test that world position (0,0) maps to grid position (-1,0) in both systems
	var world_pos = Vector2(0, 0)
	
	# Test TileMapLayer conversion
	var tilemap_grid = _tilemap.local_to_map(world_pos)
	assert_eq(tilemap_grid, Vector2i(-1, 0), 
		"TileMapLayer should map world (0,0) to grid (-1,0)")
	
	# Test AStar conversion
	var astar_grid = _util_grid.world_to_grid(world_pos)
	assert_eq(astar_grid, Vector2i(-1, 0), 
		"AStar should map world (0,0) to grid (-1,0)")
	
	# Test that both systems agree
	assert_eq(tilemap_grid, astar_grid, 
		"Both coordinate systems should agree on world (0,0) mapping")

func test_coordinate_system_consistency():
	# Test multiple world positions to verify consistency
	var test_positions = [
		Vector2(0, 0),      # Origin
		Vector2(128, 64),   # Half tile right
		Vector2(-128, -64), # Half tile left
		Vector2(256, 128),  # Full tile right
		Vector2(0, 128)     # Full tile down
	]
	
	for world_pos in test_positions:
		var tilemap_grid = _tilemap.local_to_map(world_pos)
		var astar_grid = _util_grid.world_to_grid(world_pos)
		
		assert_eq(tilemap_grid, astar_grid,
			"Coordinate systems should match for world position %s" % world_pos)
		
		# Verify conversion back to world positions
		var tilemap_world = _tilemap.map_to_local(tilemap_grid)
		var astar_world = _util_grid.grid_to_world(astar_grid)
		
		assert_almost_eq(tilemap_world.x, astar_world.x, 0.001,
			"World X coordinates should match for grid position %s" % tilemap_grid)
		assert_almost_eq(tilemap_world.y, astar_world.y, 0.001,
			"World Y coordinates should match for grid position %s" % tilemap_grid)

func test_character_position_mapping():
	# Test character position mapping at world origin (0,0)
	var char_pos = _character.position
	var tilemap_grid = _tilemap.local_to_map(char_pos)
	var astar_grid = _util_grid.world_to_grid(char_pos)
	
	# Verify world (0,0) maps to grid (-1,0) in both systems
	assert_eq(char_pos, Vector2(0, 0),
		"Character should be at world position (0,0)")
	assert_eq(tilemap_grid, Vector2i(-1, 0),
		"TileMap should map world (0,0) to grid (-1,0)")
	assert_eq(astar_grid, Vector2i(-1, 0),
		"AStar should map world (0,0) to grid (-1,0)")
	assert_eq(tilemap_grid, astar_grid,
		"Both coordinate systems should agree on mapping world (0,0) to grid (-1,0)")
	
	# Verify conversion back to world coordinates
	var tilemap_world = _tilemap.map_to_local(tilemap_grid)
	var astar_world = _util_grid.grid_to_world(astar_grid)
	
	assert_almost_eq(tilemap_world.x, 0.0, 0.001,
		"Converting grid (-1,0) back to world should give x=0")
	assert_almost_eq(tilemap_world.y, 0.0, 0.001,
		"Converting grid (-1,0) back to world should give y=0")
	assert_almost_eq(astar_world.x, 0.0, 0.001,
		"AStar grid (-1,0) to world should give x=0")
	assert_almost_eq(astar_world.y, 0.0, 0.001,
		"AStar grid (-1,0) to world should give y=0")