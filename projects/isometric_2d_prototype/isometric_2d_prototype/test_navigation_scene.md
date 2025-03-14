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