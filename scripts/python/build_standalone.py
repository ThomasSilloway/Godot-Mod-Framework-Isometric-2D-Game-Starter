#!/usr/bin/env python3
# /// script
# dependencies = [
#   "pathlib>=1.0.1",
#   "PyYAML>=6.0.1",
#   "godot-parser>=0.0.1"
# ]
# ///

import argparse
import os
import sys
from pathlib import Path
from datetime import datetime
from utils.godot import export_godot_project
from utils import run_game

def parse_args():
    parser = argparse.ArgumentParser(description='Build a standalone mod executable')
    parser.add_argument('mod_name', help='Name of the mod to build')
    return parser.parse_args()

def get_build_timestamp():
    return datetime.now().strftime("%Y-%m-%d_%H-%M-%S")

def setup_build_paths(mod_name, timestamp):
    root_dir = Path(__file__).parent.parent.parent
    build_dir = root_dir / "build" / timestamp
    mod_dir = root_dir / "projects" / mod_name
    
    if not mod_dir.exists():
        print(f"Error: Mod directory not found: {mod_dir}")
        sys.exit(1)
        
    build_dir.mkdir(parents=True, exist_ok=True)
    return root_dir, build_dir, mod_dir

def build_standalone_mod(mod_name):
    timestamp = get_build_timestamp()
    root_dir, build_dir, mod_dir = setup_build_paths(mod_name, timestamp)
    
    print(f"Building standalone executable for {mod_name}...")
    print(f"Output directory: {build_dir}")
    
    # Export using Windows Executable preset
    export_preset = "Windows Executable"
    exe_name = f"{mod_name}"
    export_path = build_dir / exe_name
    
    if export_godot_project(mod_name, build_dir, is_mod=False):
        print(f"Build completed successfully!")
        print(f"Executable location: {export_path}.exe")
        print(f"PCK file location: {export_path}.pck")
        
        # Run the game using the shared utility, passing the executable name
        if run_game(build_dir, exe_name):
            print("Game started successfully")
        else:
            print("Failed to start the game")
            sys.exit(1)
    else:
        print("Error: Build failed!")
        sys.exit(1)

def main():
    args = parse_args()
    build_standalone_mod(args.mod_name)

if __name__ == "__main__":
    main()