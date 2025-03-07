# /// script
# dependencies = [
#   "pathlib>=1.0.1",
#   "argparse>=1.4.0",
#   "PyYAML>=6.0.1",
# ]
# ///

"""Build script for a single mod.

This script builds a single mod and copies it to the latest build directory.
If no build exists, it creates a new one and copies the mod_order template.
"""

import argparse
import sys
from pathlib import Path

from config import config
from utils import (
    get_formatted_datetime,
    create_build_directories,
    get_latest_build,
    copy_previous_build_files,
    ensure_mod_order_template,
    export_godot_project,
    run_game
)

def main():
    parser = argparse.ArgumentParser(description="Build a single mod")
    parser.add_argument("mod_name", help="Name of the mod to build")
    args = parser.parse_args()

    # Get timestamp for new build
    build_time = get_formatted_datetime()
    print(f"Building mod {args.mod_name} with timestamp {build_time}")

    # IMPORTANT: We must check for previous builds BEFORE creating the new build directory
    # Otherwise get_latest_build will find our new empty directory instead of the previous build
    if prev_build := get_latest_build():
        if prev_build.name != build_time:  # Don't copy from self
            print(f"Found previous build: {prev_build}")
            
        else:
            print("Previous build is the same as current. No files copied.")
            sys.exit(1)
    else:
        print("No previous build found. Creating fresh build.")
        sys.exit(1)
        

    # Create build directories
    build_dir = create_build_directories(build_time)
    print(f"Created build directory: {build_dir}")

    print("Copying files from previous build...")
    copy_previous_build_files(prev_build, build_dir, args.mod_name)
    ensure_mod_order_template(build_dir)

    # Export the mod
    print(f"\nBuilding mod: {args.mod_name}")
    if export_godot_project(args.mod_name, build_dir, is_mod=True):
        print(f"Successfully exported mod: {args.mod_name}")
        
        # Run the game if the executable exists
        if run_game(build_dir):
            print("Game started successfully")
        else:
            print("Note: No game executable found. You may need to build the startup project first.")
    else:
        print(f"Failed to export mod: {args.mod_name}")
        sys.exit(1)

if __name__ == "__main__":
    main()