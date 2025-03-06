# 2d isometric game built with godot 4.4

## High Level Overview

Update an isometric 2d Godot mod project called isometric_2d_prototype with movement for the player character including playing walking animations

## End State (feedback Loop)

Run `projects/isometric_2d_prototype/build.bat` and confirm:
- There are no errors

## Docs

    godot 4.4: https://docs.godotengine.org/en/stable/
    TODO: Need to add actual docs that might help to the project

## Implementation Details
 - Use only Godot 4.4 syntax
 - Use the claude 3.7 as the model
 - See `isometric_2d_prototype\isometric_2d_prototype.md` for the structure of the `main_scene` and `character` scenes
 - The `isometric_2d_prototype\isometric_2d_prototype\character\character.tscn` scene contains the player
 - The animations for the `Character\AnimatedSprite2D` are specified for which direction the character is facing in degrees: 0, 45, 90, 135, 180
    - Examples:
        - walk000 - the walking up animation
        - walk090 - the walking right animation
        - walk180 - the walking down animation
      TODO: This was not specific enough
 - There are no animations for walking left, so we need to flip the sprite
 - The controls should be WASD and Arrow keys including diagonal movement - TODO: This was not specific enough
 - The tilemap is 400x200 and moving a player 1 tile directly down results in x=0, y=200
 - Don't try to open the godot editor to test or verify or for any reason

##Tasks (Aka Prompts)

1. Create player character movement script
```
 - Create an player.gd in isometric_2d_prototype\isometric_2d_prototype\character folder
 - Update player.gd with WASD and Arrow key movement including diagonal movement
   - Convert input directions to isometric movement vectors
   - Apply movement vectors to `CharacterBody2D` using `move_and_slide()`
 - Create an export variable to control the speed of the character
 - Attach the player.gd script to the root of the character.tscn scene
```

2. Create animation player script
```
 - Create an animation_player.gd in isometric_2d_prototype\isometric_2d_prototype\character folder
 - Attach the animation_player.gd script to the AnimatedSprite2D node in the character.tscn scene
 - Update animation_player.gd to play the correct animation based on the direction the player is moving
 - Make sure to consider flipping the sprite when moving left
 - Make sure to handle the case when there's no player input, keep playing the last animation
```

3. Double check your implementation
```
 - Make sure the High Level Overview was implemented correctly
```

4. Verification
```
TODO: See if we can just run the game by itself and pipe the output into the batch file output
Validate your code works by running the `Build Isometric 2D Prototype` task in VSCode

You should see a log message that says the isometric_2d_prototype mod was loaded and no errors
```