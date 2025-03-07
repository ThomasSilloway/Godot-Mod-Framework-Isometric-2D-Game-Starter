"""
Build script utility modules.
"""

"""Build utilities package.

This package provides modules for handling various build-related tasks:
- paths: Project path resolution and file operations
- time: Date/time formatting and build timestamps
- godot: Godot process execution and exports 
- build: Common build operations and validation
"""

from .paths import (
    get_project_path,
    get_build_path,
    create_build_directories,
    copy_previous_build_files,
    get_latest_build
)

from .time import get_formatted_datetime

from .godot import export_godot_project

from .build import ensure_mod_order_template, run_game

__all__ = [
    'get_project_path',
    'get_build_path',
    'create_build_directories',
    'copy_previous_build_files',
    'get_latest_build',
    'get_formatted_datetime',
    'export_godot_project',
    'ensure_mod_order_template',
    'run_game'
]