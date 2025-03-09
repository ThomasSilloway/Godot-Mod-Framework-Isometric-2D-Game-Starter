# Godot Mod Framework Isometric 2D Game Starter
A Godot game template that is set up for mod support from the beginning

This Menus version includes a main menu and a settings menu

Inspired by: https://www.youtube.com/watch?v=tTdToEu6x8U and https://www.youtube.com/watch?v=K3MnEvrC8TA

## Purpose

Build the game as a collection of mods to ensure that your game properly supports modders upon release

## Description

### Template
 - Built as a template from [Godot-Mod-Framework-Menus](https://github.com/ThomasSilloway/Godot-Mod-Framework-Menus)

### Full Game Mod (this repo)
 - Uses TileMapLayers to create an environment
 - See [Task List](https://github.com/ThomasSilloway/Godot-Mod-Framework-Isometric-2D-Game-Starter/blob/main/ai_coding_prompts/task_list.txt) for upcoming features

## Tech Details

- Each mod is a separate godot project
- `startup` is the main project that does loading mods. Handles global things too like Settings, Config
- `mainmenu` is the first mod that displays the main menu for the project.
- `settings_menu` is the mod that injects a settings button into the main menu which opens a settings menu
  - The settings menu updates the values in the `SettingsManager` in the `main` project automatically by having its own placeholder `SettingsManager` autoloaded which is not included in the exported project. Surprisingly having a file in the auto load that is not included in the exported project doesn't break anything.
- `isometric_2d_prototype` is the mod that is used as the main game when you hit the `Play` button in the main menu

## Usage - Manual

- Export `start` project as an .exe (Turning on Export Console Wrapper is handy for testing)
  - Export folder: build
- Export mod projects as a .zip and put it into the 
  - Export folder: build/mods

- Run the `startup` executable and view the logs to see it's try to load mods, but none are found

## Usage - Automated
- Update `scripts/build.bat` to match your paths
- Run the build batch file to automatically create versioned builds
- There's also individual build batch files for each mod that can be run to build just that mod and copy the previous builds files into this build

## Updating From Template

Info from: [Stack Overflow](https://stackoverflow.com/questions/56577184/github-pull-changes-from-a-template-repository)

If you need to pull in updates from this template after creating your game, you can do so using the following Git commands:

```bash
# Add this template repository as a remote
git remote add template [URL of the template repo]

# Fetch all changes
git fetch --all

# Merge changes from the template's branch to your current branch
git merge template/[branch to merge] --allow-unrelated-histories
```

For more details, see: https://help.github.com/en/articles/adding-a-remote

## Areas to explore in the future
 - TODO

## Credits

### Art
- [MaxParata](https://maxparata.itch.io/monogon-isometricdungeon)
- [Engvee](https://engvee.itch.io/animated-isometric-prototyping-hero)
- [KennyNL](https://kenney.nl/)
