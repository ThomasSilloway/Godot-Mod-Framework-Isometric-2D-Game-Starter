
---

# test_navigation_collision_scene
## Nodes
- **MainScene** (Node2D)
  - **Tilemap** (Node2D)
    - **TileMapLayer-Ground** (TileMapLayer)
      - tile_set: res://isometric_2d_prototype/tilemap_proto_02_kenny_farm/tilemap_proto_02_kenny_farm.tres
    - **YSortables** (Node2D)
  - **Isometric-Navigation** (Node2D)
    - script: res://isometric_2d_prototype/navigation/a_star_2d_navigation.gd
    - **Wall-Collision-Detector** (Node2D)
      - script: res://isometric_2d_prototype/navigation/wall_collision_detector.gd
  - **World-Draw-Debug** (Node2D)
    - script: res://isometric_2d_prototype/debug/world_debug_draw.gd
- **Character-Male-Kenny** (res://isometric_2d_prototype/characters/proto_male_kenny/character_male_kenny.tscn, instanced scene)
- **Camera2D** (Camera2D)
- **TileMapLayer-Walls-West** (TileMapLayer)
  - tile_set: res://isometric_2d_prototype/tilemap_proto_02_kenny_farm/tilemap_proto_02_kenny_farm.tres
- **TileMapLayer-Walls-East** (TileMapLayer)
  - tile_set: res://isometric_2d_prototype/tilemap_proto_02_kenny_farm/tilemap_proto_02_kenny_farm.tres
- **TileMapLayer-Walls-North** (TileMapLayer)
  - tile_set: res://isometric_2d_prototype/tilemap_proto_02_kenny_farm/tilemap_proto_02_kenny_farm.tres
- **TileMapLayer-Walls-South** (TileMapLayer)
  - tile_set: res://isometric_2d_prototype/tilemap_proto_02_kenny_farm/tilemap_proto_02_kenny_farm.tres
- **Cursor** (Node2D)
- **Front** (Sprite2D)
  - texture: res://isometric_2d_prototype/cursor/cursor_outline_character_size_front.png
- **Back** (Sprite2D)
  - texture: res://isometric_2d_prototype/cursor/cursor_outline_character_size_back.png

---

# character_male_kenny
## Nodes
- **Character** (CharacterBody2D)
  - script: res://isometric_2d_prototype/character_controller/character_controller_point_and_click.gd
  - **AnimatedSprite2D** (AnimatedSprite2D)
    - script: res://isometric_2d_prototype/characters/animation_player.gd
  - **CollisionShape2D** (CollisionShape2D)
