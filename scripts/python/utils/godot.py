# /// script
# dependencies = [
#   "pathlib>=1.0.1",
#   "PyYAML>=6.0.1",
# ]
# ///

"""Godot utilities for build scripts."""

import os
import subprocess
from pathlib import Path

def export_godot_project(project_name: str, build_dir: Path, is_mod: bool = True) -> bool:
    """Export a Godot project.
    
    Args:
        project_name: Name of the project to export
        build_dir: Path to build directory
        is_mod: Whether this is a mod project (True) or startup project (False)
        
    Returns:
        True if export was successful, False otherwise
    """
    from scripts.python.config import config
    from scripts.python.utils.paths import get_project_path
    
    project_dir = get_project_path() / project_name
    if not project_dir.exists():
        print(f"Project directory not found: {project_dir}")
        return False

    # Change to project directory for export
    original_dir = os.getcwd()
    try:
        os.chdir(str(project_dir))

        # Set up export path based on project type
        if is_mod:
            export_name = f"{project_name}{config.mod_extension}"
            output_file = build_dir / config.mods_dir / export_name
            preset = "Windows Desktop"  # Using the actual preset name from export_presets.cfg
            export_type = "--export-pack"  # Use --export-pack for mods
        else:
            export_name = f"{project_name}.exe"  # Add .exe extension for startup project
            output_file = build_dir / export_name
            preset = "Windows Desktop"  # Using the actual preset name from export_presets.cfg
            export_type = "--export-release"  # Use --export-release for startup project
        
        # Execute Godot export command
        command = [
            str(config.godot_path),
            "--headless",
            "--path", str(project_dir),
            export_type, preset,
            str(output_file)  # Add the output path to the command
        ]
        
        result = subprocess.run(
            command,
            capture_output=True,
            text=True
        )
        
        if result.returncode != 0:
            print("Export command failed:")
            print(f"Return code: {result.returncode}")
            print(f"stdout: {result.stdout}")
            print(f"stderr: {result.stderr}")
            return False
            
        if output_file.exists():
            return True
        else:
            print(f"Export command succeeded but output file not found at: {output_file}")
            return False
    except subprocess.CalledProcessError as e:
        print(f"Export failed for {project_name}:")
        print(e.stderr)
        return False
    except Exception as e:
        print(f"Unexpected error during export: {str(e)}")
        return False
    finally:
        # Restore original directory
        os.chdir(original_dir)
        # print(f"Restored working directory to: {os.getcwd()}")