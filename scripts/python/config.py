# /// script
# dependencies = [
#   "PyYAML>=6.0.1",
#   "pathlib>=1.0.1",
# ]
# ///

"""Configuration management for build scripts.

This module handles loading and accessing configuration from config.yaml,
with support for environment variable overrides.
"""

import os
from pathlib import Path
import yaml

class Config:
    def __init__(self):
        self._config = self._load_config()
        self._apply_env_overrides()

    def _load_config(self) -> dict:
        """Load configuration from config.yaml"""
        config_path = Path(__file__).parent.parent / "config.yaml"
        try:
            with open(config_path) as f:
                return yaml.safe_load(f)
        except FileNotFoundError:
            print(f"Warning: Config file not found at {config_path}")
            return self._get_default_config()
        except yaml.YAMLError as e:
            print(f"Warning: Error parsing config file: {e}")
            return self._get_default_config()

    def _get_default_config(self) -> dict:
        """Get default configuration values"""
        return {
            "godot": {
                "path": "C:\\Godot\\Godot_v4.4-beta4_win64",
                "version": "4.4-beta4"
            },
            "build": {
                "mods_dir": "mods",
                "mod_extension": ".zip",
                "startup_project": "startup",
                "startup_exe": "startup.exe",
                "startup_console_exe": "startup.console.exe"
            }
        }

    def _apply_env_overrides(self):
        """Apply environment variable overrides to config"""
        if godot_path := os.environ.get("GODOT_PATH"):
            self._config["godot"]["path"] = godot_path

    @property
    def godot_path(self) -> Path:
        """Get the configured Godot executable path"""
        return Path(self._config["godot"]["path"])

    @property
    def mods_dir(self) -> str:
        """Get the mods directory name"""
        return self._config["build"]["mods_dir"]

    @property
    def mod_extension(self) -> str:
        """Get the mod file extension"""
        return self._config["build"]["mod_extension"]

    @property
    def startup_project(self) -> str:
        """Get the startup project name"""
        return self._config["build"]["startup_project"]

    @property
    def startup_exe(self) -> str:
        """Get the startup executable name"""
        return self._config["build"]["startup_exe"]

    @property
    def startup_console_exe(self) -> str:
        """Get the startup console executable name"""
        return self._config["build"]["startup_console_exe"]

# Global config instance
config = Config()