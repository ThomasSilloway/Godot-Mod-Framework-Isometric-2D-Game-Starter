# init_scene
## Nodes
- **IsometricInit** (Node)
  - script: res://isometric_2d_prototype/init_mod_setup/init_scene.gd


---

# main_scene
## Nodes
- **MainScene** (Node2D)
  - **Camera2D** (Camera2D)
  - **Tilemap** (Node2D)
    - **TileMapLayer-L1** (TileMapLayer)
      - tile_set: res://isometric_2d_prototype/tilemap/main_tilemap.tres
    - **TileMapLayer-Walls-NS** (TileMapLayer)
      - tile_set: res://isometric_2d_prototype/tilemap/main_tilemap.tres
    - **TileMapLayer-Walls-EW** (TileMapLayer)
      - tile_set: res://isometric_2d_prototype/tilemap/main_tilemap.tres
    - **TileMapLayer-L2** (TileMapLayer)
      - tile_set: res://isometric_2d_prototype/tilemap/main_tilemap.tres
  - **Character** (res://isometric_2d_prototype/character/character.tscn, instanced scene)


---

# character
## Nodes
- **Character** (Node2D)
  - **AnimatedSprite2D** (AnimatedSprite2D)
  - **CharacterBody2D** (CharacterBody2D)
    - **CollisionShape2D** (CollisionShape2D)
