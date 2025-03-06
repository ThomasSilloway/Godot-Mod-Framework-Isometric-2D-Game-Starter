# 2d isometric game built with godot 4.3

## High Level Overview

Update an empty Godot mod project called isometric_2d_prototype with the basic mod framework

## End State (feedback Loop)

Run `scripts/build.bat` and confirm:
- There are no errors
- The log message that says isometric_2d_prototype has loaded

## Docs

    godot 4.3: https://docs.godotengine.org/en/stable/

## Implementation Details
 - Reuse existing structure from `flappy_bird_clone`
 - Use only Godot 4.3 syntax
 - Use the claude 3.5 as the model
 - Use the same logging pattern as the `flappy_bird_clone` project
 - Need an `init_scene.tscn`, and `init_scene.gd`
 - Use the folder projects/isometric_2d_prototype

##Tasks (Aka Prompts)

1. Create basic project template
```
TODO: Need to tell it to make a placeholder game scene like `flappy_bird_game.tscn`
 - Create an init_scene.tscn in isometric_2d_prototype\isometric_2d_prototype folder based off the one in the `flappy_bird_clone` project
 - Create a init_scene.gd in scripts folder based off of the init_scene.gd file in the `flappy_bird_clone` project
```

2. Create tools
```
- Add a build.bat in isometric_2d_prototype root folder that does the same functionality as the build.bat in the flappy_bird_clone project
TODO Next time - build.bat was broken, need to tell it to literally copy the other one and just update the name
- Add a `export_presets.cfg` in isometric_2d_prototype root folder similar to the flappy_bird_clone project
TODO: Export presets were wrong - it should be an exact copy
- Add a `Build Isometric 2D Prototype` task to `tasks.json` to run the new `build.bat` from step 3
```

3. Double check your implementation
```
 - Make sure it matches the same file and folder structure as `flappy_bird_clone`
```

4. Verification
```
Validate your code works with the following command:

C:\GithubRepos\GodotModCapableGame\scripots\build.bat

You should see a log message that says the isometric_2d_prototype mod was loaded
```