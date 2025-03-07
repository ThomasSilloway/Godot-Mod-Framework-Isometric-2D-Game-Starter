# /// script
# dependencies = [
#   "pathlib>=1.0.1",
#   "PyYAML>=6.0.1",
#   "pywin32>=306",
# ]
# ///

"""Build utilities for build scripts."""

import os
import sys
import time
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

def run_game(build_dir: Path, exe_name: str = None) -> bool:
    """Run the game executable from the build directory.
    
    Args:
        build_dir: Path to build directory
        exe_name: Optional name of the executable (without extension). If not provided, uses startup executable.
        
    Returns:
        True if game was started successfully, False otherwise
    """
    from scripts.python.config import config
    
    # First try the specified executable name if provided
    if exe_name:
        exe_paths = [
            build_dir / f"{exe_name}.console.exe",
            build_dir / f"{exe_name}.exe"
        ]
    else:
        # Fall back to startup executable
        exe_paths = [
            build_dir / config.startup_console_exe,
            build_dir / "startup.exe"
        ]
    
    # Try each possible executable path
    for exe_path in exe_paths:
        if exe_path.exists():
            try:
                os.chdir(str(build_dir))
                # Run in same console and wait for it to start
                process = subprocess.Popen([str(exe_path)], creationflags=subprocess.CREATE_NEW_PROCESS_GROUP)
                
                # Give it a moment to start
                time.sleep(0.5)
                
                if sys.platform == "win32":
                    try:
                        import win32gui
                        import win32con
                        
                        def bring_to_front(hwnd, _):
                            if "Godot" in win32gui.GetWindowText(hwnd):
                                win32gui.ShowWindow(hwnd, win32con.SW_RESTORE)
                                win32gui.SetForegroundWindow(hwnd)
                                return False
                            return True
                            
                        # Find and focus the Godot window
                        win32gui.EnumWindows(bring_to_front, None)
                    except ImportError:
                        print("Note: win32gui not available - window focus not set")
                
                return True
            except Exception as e:
                print(f"Failed to run game: {e}")
                return False
    
    print(f"No executable found in: {build_dir}")
    return False