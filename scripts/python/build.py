# /// script
# dependencies = [
#   "argparse>=1.4.0",
#   "pathlib>=1.0.1",
# ]
# ///

"""Build script for all mods.

This script builds the startup project and all mods in the correct order.
"""

import sys
from build_utils import (
    get_formatted_datetime,
    create_build_directories,
    ensure_mod_order_template,
    export_godot_project,
    run_game,
    STARTUP_PROJECT
)

MODS = [
    "main_menu",
    "settings_menu",
    "isometric_2d_prototype"
]

def main():
    # Get timestamp for new build
    build_time = get_formatted_datetime()
    print(f"Building all projects with timestamp {build_time}")

    # Create build directories
    build_dir = create_build_directories(build_time)
    print(f"Created build directory: {build_dir}")

    # Ensure mod order template exists
    ensure_mod_order_template(build_dir)

    # First build startup project
    print(f"\nBuilding startup project...")
    if not export_godot_project(STARTUP_PROJECT, build_dir, is_mod=False):
        print("Failed to export startup project")
        sys.exit(1)
    print("Successfully exported startup project")

    # Then build all mods
    for mod_name in MODS:
        print(f"\nBuilding mod: {mod_name}")
        if not export_godot_project(mod_name, build_dir, is_mod=True):
            print(f"Failed to export mod: {mod_name}")
            sys.exit(1)
        print(f"Successfully exported mod: {mod_name}")

    print("\nAll projects built successfully!")

    # Run the game
    if run_game(build_dir):
        print("Game started successfully")
    else:
        print("Failed to start the game")
        sys.exit(1)

if __name__ == "__main__":
    main()