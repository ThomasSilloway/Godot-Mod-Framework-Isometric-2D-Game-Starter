# /// script
# dependencies = [
#   "pathlib>=1.0.1",
#   "PyYAML>=6.0.1",
# ]
# ///

"""Build utilities for build scripts."""

import os
import subprocess
import shutil
from pathlib import Path

def ensure_mod_order_template(build_dir: Path):
    """Ensure mod_order.yaml exists in the build mods directory.
    
    Args:
        build_dir: Path to build directory
    """
    from scripts.python.config import config
    
    template_path = Path(__file__).parent.parent.parent / "mod_order_template.yaml"
    target_path = build_dir / config.mods_dir / "mod_order.yaml"
    
    if template_path.exists() and not target_path.exists():
        shutil.copy2(template_path, target_path)

def run_game(build_dir: Path) -> bool:
    """Run the game executable from the build directory.
    
    Args:
        build_dir: Path to build directory
        
    Returns:
        True if game was started successfully, False otherwise
    """
    from scripts.python.config import config
    
    exe_path = build_dir / "startup.exe"  # Use startup.exe instead of console version
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