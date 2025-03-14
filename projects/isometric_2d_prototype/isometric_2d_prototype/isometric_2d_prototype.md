# init_scene
## Nodes
- **IsometricInit** (Node)
  - script: res://isometric_2d_prototype/init_mod_setup/init_scene.gd


---

# main_scene
## Nodes
- **MainScene** (Node2D)
  - **Tilemap** (Node2D)
    - **TileMapLayer-Ground** (TileMapLayer)
      - tile_set: res://isometric_2d_prototype/tilemap_proto_02_kenny_farm/tilemap_proto_02_kenny_farm.tres
    - **TileMapLayer-GroundCover** (TileMapLayer)
      - tile_set: res://isometric_2d_prototype/tilemap_proto_02_kenny_farm/tilemap_proto_02_kenny_farm.tres
    - **YSortables** (Node2D)
  - **Isometric-Navigation** (Node2D)
    - script: res://isometric_2d_prototype/navigation/isometric_navigation.gd
  - **World-Draw-Debug** (Node2D)
    - script: res://isometric_2d_prototype/debug/world_debug_draw.gd
- **Character-Male-Kenny** (res://isometric_2d_prototype/characters/proto_male_kenny/character_male_kenny.tscn, instanced scene)
- **Camera2D** (Camera2D)
- **TileMapLayer-Walls-EW** (TileMapLayer)
  - tile_set: res://isometric_2d_prototype/tilemap_proto_02_kenny_farm/tilemap_proto_02_kenny_farm.tres
- **TileMapLayer-Walls-NS** (TileMapLayer)
  - tile_set: res://isometric_2d_prototype/tilemap_proto_02_kenny_farm/tilemap_proto_02_kenny_farm.tres
- **TileMapLayer-Props** (TileMapLayer)
  - tile_set: res://isometric_2d_prototype/tilemap_proto_02_kenny_farm/tilemap_proto_02_kenny_farm.tres
- **TileMapLayer-Props2** (TileMapLayer)
  - tile_set: res://isometric_2d_prototype/tilemap_proto_02_kenny_farm/tilemap_proto_02_kenny_farm.tres


---

# main_scene_proto_01
## Nodes
- **MainScene** (Node2D)
  - **Tilemap** (Node2D)
    - **TileMapLayer-L1** (TileMapLayer)
      - tile_set: res://isometric_2d_prototype/tilemap_proto_01/tilemap_proto_01.tres
    - **TileMapLayer-L2** (TileMapLayer)
      - tile_set: res://isometric_2d_prototype/tilemap_proto_01/tilemap_proto_01.tres
    - **YSortables** (Node2D)
- **TileMapLayer-Walls-EW** (TileMapLayer)
  - tile_set: res://isometric_2d_prototype/tilemap_proto_01/tilemap_proto_01.tres
- **TileMapLayer-Walls-NS** (TileMapLayer)
  - tile_set: res://isometric_2d_prototype/tilemap_proto_01/tilemap_proto_01.tres
- **Character-Male-Kenny** (res://isometric_2d_prototype/characters/proto_male_kenny/character_male_kenny.tscn, instanced scene)
- **Camera2D** (Camera2D)


---

# test_navigation_collision_scene
## Nodes
- **MainScene** (Node2D)
  - **Tilemap** (Node2D)
    - **TileMapLayer-Ground** (TileMapLayer)
      - tile_set: res://isometric_2d_prototype/tilemap_proto_02_kenny_farm/tilemap_proto_02_kenny_farm.tres
    - **YSortables** (Node2D)
  - **Isometric-Navigation** (Node2D)
    - script: res://isometric_2d_prototype/navigation/isometric_navigation.gd
  - **World-Draw-Debug** (Node2D)
    - script: res://isometric_2d_prototype/debug/world_debug_draw.gd
- **Character-Male-Kenny** (res://isometric_2d_prototype/characters/proto_male_kenny/character_male_kenny.tscn, instanced scene)
- **Camera2D** (Camera2D)
- **TileMapLayer-Walls-EW** (TileMapLayer)
  - tile_set: res://isometric_2d_prototype/tilemap_proto_02_kenny_farm/tilemap_proto_02_kenny_farm.tres
- **TileMapLayer-Walls-NS** (TileMapLayer)
  - tile_set: res://isometric_2d_prototype/tilemap_proto_02_kenny_farm/tilemap_proto_02_kenny_farm.tres


---

# test_navigation_scene
## Nodes
- **MainScene** (Node2D)
  - **Tilemap** (Node2D)
    - **TileMapLayer-Ground** (TileMapLayer)
      - tile_set: res://isometric_2d_prototype/tilemap_proto_02_kenny_farm/tilemap_proto_02_kenny_farm.tres
    - **YSortables** (Node2D)
  - **Isometric-Navigation** (Node2D)
    - script: res://isometric_2d_prototype/navigation/isometric_navigation.gd
  - **World-Draw-Debug** (Node2D)
    - script: res://isometric_2d_prototype/debug/world_debug_draw.gd
- **Character-Male-Kenny** (res://isometric_2d_prototype/characters/proto_male_kenny/character_male_kenny.tscn, instanced scene)
- **Camera2D** (Camera2D)


---

# character_female
## Nodes
- **Character** (CharacterBody2D)
  - script: res://isometric_2d_prototype/character_controller/character_controller_WASD.gd
  - **AnimatedSprite2D** (AnimatedSprite2D)
    - script: res://isometric_2d_prototype/characters/animation_player.gd
  - **CollisionShape2D** (CollisionShape2D)


---

# character_male_kenny
## Nodes
- **Character** (CharacterBody2D)
  - script: res://isometric_2d_prototype/character_controller/character_controller_point_and_click.gd
  - **AnimatedSprite2D** (AnimatedSprite2D)
    - script: res://isometric_2d_prototype/characters/animation_player.gd
  - **CollisionShape2D** (CollisionShape2D)
