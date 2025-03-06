# game_placeholder
## Nodes
- **GamePlaceholder** (Node2D)
  - **Polygon2D** (Polygon2D)
  - **HUD** (Control)
    - **Label** (Label)
      - text: "Placeholder Game from Main Menu"


---

# init_scene
## Nodes
- **main_menu_init** (Node2D)
  - script: res://main_menu/scripts/init_scene.gd


---

# main_menu
## Nodes
- **MainMenu** (Control)
  - script: res://main_menu/scripts/main_menu.gd
  - **ColorRect** (ColorRect)
  - **Title** (Label)
    - text: "Game Title"
  - **VBoxContainer** (VBoxContainer)
    - **Button_Play** (Button)
      - text: "Play"
    - **Button_Exit** (Button)
      - text: "Exit"

## Connections
- When signal 'pressed' is emitted from 'VBoxContainer/Button_Play', call method '_play' on 'MainMenu'.
- When signal 'pressed' is emitted from 'VBoxContainer/Button_Exit', call method '_quit' on 'MainMenu'.
