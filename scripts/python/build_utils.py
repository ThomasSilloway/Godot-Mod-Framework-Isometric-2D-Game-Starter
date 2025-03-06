# /// script
# dependencies = [
#   "PyYAML>=6.0.1",
#   "pathlib>=1.0.1",
# ]
# ///

"""Shared utilities for build scripts.

This module provides common functionality used by build.py and build_one_mod.py
for building Godot projects and managing builds.

Dependencies (for uv):
- datetime
- pathlib
- subprocess
- shutil
- yaml
"""

import datetime
import os
import subprocess
from pathlib import Path
import shutil
import yaml

# Constants
GODOT_PATH = Path(r"C:\Godot\Godot_v4.4-beta4_win64")
WORKSPACE_ROOT = Path(__file__).parent.parent.parent
PROJECT_PATH = WORKSPACE_ROOT / "projects"
BUILD_PATH = WORKSPACE_ROOT / "build"
MODS_DIR = "mods"
MOD_EXTENSION = ".zip"
STARTUP_PROJECT = "startup"
STARTUP_EXE = "startup.exe"
STARTUP_CONSOLE_EXE = "startup.console.exe"

def get_formatted_datetime():
    """Get current date and time in the format YYYY-MM-DD_HH-MM-SS."""
    now = datetime.datetime.now()
    return now.strftime("%Y-%m-%d_%H-%M-%S")

def create_build_directories(build_time: str) -> Path:
    """Create build directories for the given timestamp.
    
    Args:
        build_time: Timestamp string in format YYYY-MM-DD_HH-MM-SS
        
    Returns:
        Path to the new build directory
    """
    build_dir = BUILD_PATH / build_time
    mods_dir = build_dir / MODS_DIR
    
    build_dir.mkdir(parents=True, exist_ok=True)
    mods_dir.mkdir(parents=True, exist_ok=True)
    
    return build_dir

def get_latest_build() -> Path | None:
    """Find the most recent build directory.
    
    Returns:
        Path to latest build directory or None if no builds exist
    """
    try:
        # Sort build directories by name (which is timestamp) in reverse order
        builds = [d for d in BUILD_PATH.iterdir() if d.is_dir() and d.name != MODS_DIR]
        if not builds:
            return None
            
        # Parse timestamps and sort by actual datetime
        def parse_build_time(p: Path) -> datetime.datetime:
            try:
                return datetime.datetime.strptime(p.name, "%Y-%m-%d_%H-%M-%S")
            except ValueError:
                # Return a very old date for invalid timestamps
                return datetime.datetime(1970, 1, 1)
                
        return max(builds, key=parse_build_time)
    except FileNotFoundError:
        return None

def copy_previous_build_files(source_dir: Path, target_dir: Path, current_mod: str | None = None):
    """Copy all files from previous build to new build directory.
    
    Args:
        source_dir: Path to source directory
        target_dir: Path to target directory
        current_mod: Name of the mod being built, to avoid copying its old version
    """
    if not source_dir.exists():
        print(f"Previous build directory not found: {source_dir}")
        return

    print(f"\nCopying from previous build:")
    print(f"Source dir: {source_dir}")
    print(f"Target dir: {target_dir}")
    print(f"Current mod: {current_mod}")

    try:
        # First ensure the target mods directory exists
        target_mods_dir = target_dir / MODS_DIR
        target_mods_dir.mkdir(parents=True, exist_ok=True)

        # Copy startup files from root
        for file_name in [STARTUP_CONSOLE_EXE, STARTUP_EXE, "startup.pck"]:
            source_file = source_dir / file_name
            if source_file.exists():
                print(f"Copying startup file: {file_name}")
                shutil.copy2(source_file, target_dir / file_name)
            else:
                print(f"Warning: {file_name} not found in source build")

        # Copy mod_order.yaml if it exists
        source_mod_order = source_dir / MODS_DIR / "mod_order.yaml"
        if source_mod_order.exists():
            print("Copying mod_order.yaml")
            shutil.copy2(source_mod_order, target_mods_dir / "mod_order.yaml")
        
        # Copy mod files except current
        source_mods_dir = source_dir / MODS_DIR
        if source_mods_dir.exists():
            print("\nExisting mods:")
            for mod_file in source_mods_dir.glob("*.zip"):
                print(f"Found mod: {mod_file.name}")
                if current_mod and mod_file.stem == current_mod:
                    print(f"Skipping current mod: {mod_file.name}")
                    continue
                print(f"Copying mod: {mod_file.name}")
                shutil.copy2(mod_file, target_mods_dir / mod_file.name)
                
    except Exception as e:
        print(f"Warning: Error copying files from previous build:")
        print(f"  {str(e)}")
        import traceback
        traceback.print_exc()

def ensure_mod_order_template(build_dir: Path):
    """Ensure mod_order.yaml exists in the build mods directory.
    
    Args:
        build_dir: Path to build directory
    """
    template_path = WORKSPACE_ROOT / "scripts" / "mod_order_template.yaml"
    target_path = build_dir / MODS_DIR / "mod_order.yaml"
    
    if template_path.exists() and not target_path.exists():
        shutil.copy2(template_path, target_path)

def export_godot_project(project_name: str, build_dir: Path, is_mod: bool = True) -> bool:
    """Export a Godot project.
    
    Args:
        project_name: Name of the project to export
        build_dir: Path to build directory
        is_mod: Whether this is a mod project (True) or startup project (False)
        
    Returns:
        True if export was successful, False otherwise
    """
    project_dir = PROJECT_PATH / project_name
    
    if is_mod:
        output_file = build_dir / MODS_DIR / f"{project_name}{MOD_EXTENSION}"
        export_preset = "Windows Desktop"
        export_type = "--export-pack"
    else:
        output_file = build_dir / STARTUP_EXE
        export_preset = "Windows Desktop"
        export_type = "--export-release"
    
    try:
        result = subprocess.run(
            [
                str(GODOT_PATH),
                "--headless",
                "--path",
                str(project_dir),
                export_type,
                export_preset,
                str(output_file)
            ],
            check=True,
            capture_output=True,
            text=True
        )
        return output_file.exists()
    except subprocess.CalledProcessError as e:
        print(f"Export failed for {project_name}:")
        print(e.stderr)
        return False

def run_game(build_dir: Path) -> bool:
    """Run the game executable from the build directory.
    
    Args:
        build_dir: Path to build directory
        
    Returns:
        True if game was started successfully, False otherwise
    """
    exe_path = build_dir / STARTUP_CONSOLE_EXE
    if not exe_path.exists():
        print(f"No executable found at: {exe_path}")
        return False
        
    try:
        os.chdir(str(build_dir))
        subprocess.Popen([str(exe_path)], creationflags=subprocess.CREATE_NEW_CONSOLE)
        return True
    except Exception as e:
        print(f"Failed to run game: {e}")
        return False