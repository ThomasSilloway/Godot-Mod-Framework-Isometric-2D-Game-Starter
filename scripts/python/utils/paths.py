# /// script
# dependencies = [
#   "pathlib>=1.0.1",
#   "PyYAML>=6.0.1",
# ]
# ///

"""Path utilities for build scripts."""

import shutil
from pathlib import Path

# Get workspace root from this file's location
WORKSPACE_ROOT = Path(__file__).parent.parent.parent.parent

def get_project_path() -> Path:
    """Get the projects directory path."""
    return WORKSPACE_ROOT / "projects"

def get_build_path() -> Path:
    """Get the builds directory path."""
    return WORKSPACE_ROOT / "build"

def create_build_directories(build_time: str) -> Path:
    """Create build directories for the given timestamp.
    
    Args:
        build_time: Timestamp string in format YYYY-MM-DD_HH-MM-SS
        
    Returns:
        Path to the new build directory
    """
    from scripts.python.config import config
    
    build_dir = get_build_path() / build_time
    mods_dir = build_dir / config.mods_dir
    
    build_dir.mkdir(parents=True, exist_ok=True)
    mods_dir.mkdir(parents=True, exist_ok=True)
    
    return build_dir

def get_latest_build() -> Path | None:
    """Find the most recent build directory.
    
    Returns:
        Path to latest build directory or None if no builds exist
    """
    from scripts.python.config import config
    from scripts.python.utils.time import parse_build_time
    
    try:
        # Sort build directories by name (which is timestamp) in reverse order
        builds = [d for d in get_build_path().iterdir() 
                 if d.is_dir() and d.name != config.mods_dir]
        if not builds:
            return None
            
        return max(builds, key=lambda p: parse_build_time(p.name))
    except FileNotFoundError:
        return None

def copy_previous_build_files(source_dir: Path, target_dir: Path, current_mod: str | None = None):
    """Copy all files from previous build to new build directory.
    
    Args:
        source_dir: Path to source directory
        target_dir: Path to target directory
        current_mod: Name of the mod being built, to avoid copying its old version
    """
    from scripts.python.config import config
    
    if not source_dir.exists():
        print(f"Previous build directory not found: {source_dir}")
        return

    print(f"\nCopying from previous build:")
    print(f"Source dir: {source_dir}")
    print(f"Target dir: {target_dir}")
    print(f"Current mod: {current_mod}")

    try:
        # First ensure the target mods directory exists
        target_mods_dir = target_dir / config.mods_dir
        target_mods_dir.mkdir(parents=True, exist_ok=True)

        # Copy startup files from root
        startup_files = [config.startup_console_exe, config.startup_exe, "startup.pck"]
        for file_name in startup_files:
            source_file = source_dir / file_name
            if source_file.exists():
                print(f"Copying startup file: {file_name}")
                shutil.copy2(source_file, target_dir / file_name)
            else:
                print(f"Warning: {file_name} not found in source build")

        # Copy mod_order.yaml if it exists
        source_mod_order = source_dir / config.mods_dir / "mod_order.yaml"
        if source_mod_order.exists():
            print("Copying mod_order.yaml")
            shutil.copy2(source_mod_order, target_mods_dir / "mod_order.yaml")
        
        # Copy mod files except current
        source_mods_dir = source_dir / config.mods_dir
        if source_mods_dir.exists():
            print("\nExisting mods:")
            for mod_file in source_mods_dir.glob(f"*{config.mod_extension}"):
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