# Build Scripts Cleanup and Reorganization

## High Level Overview

Clean up and improve the organization of the recently converted Python build scripts by:
1. Moving script dependencies into inline script metadata
2. Externalizing the Godot path configuration
3. Reorganizing build_utils.py into a proper module structure

## End State (Feedback Loop)

- All Python scripts use inline script metadata for dependencies
- Godot path is configurable via an external config file
- build_utils.py functionality is split into logical modules
- All scripts maintain their existing functionality

## Docs

- [UV Package Documentation](c:\GithubRepos\GMF-Isometric-2D-Starter\scripts\ai_support_docs\uv-usage.md)

## File Structure

```
scripts/
├── python/
│   ├── build.py               # Main build script
│   ├── build_one_mod.py       # Single mod build script
│   ├── config.py             # New: Configuration management
│   └── utils/
│       ├── __init__.py       # New: Package initialization
│       ├── godot.py          # New: Godot-related utilities
│       ├── paths.py          # New: Path handling utilities
│       ├── build.py          # New: Build-related utilities
│       └── time.py           # New: Time formatting utilities
└── config.yaml               # New: External configuration file
```

## Implementation Details

### 1. Script Dependencies

Convert all --with commands to inline script metadata using PEP 723 format:

```python
# /// script
# dependencies = [
#   "dependency1<version",
#   "dependency2>=version",
# ]
# ///
```

### 2. Configuration Management

Create a config.yaml file:
```yaml
godot:
  path: "path/to/godot.exe"
  version: "4.2.1"
```

Create config.py to handle configuration:
- Load config from YAML file
- Provide default values
- Allow environment variable overrides

### 3. Utils Module Structure

Split build_utils.py into focused modules:

1. **paths.py**:
   - Project path resolution
   - Build directory management
   - File copy operations

2. **time.py**:
   - Date/time formatting
   - Timestamp generation
   - Build folder naming

3. **godot.py**:
   - Godot process execution
   - Command building
   - Export handling

4. **build.py**:
   - Build validation
   - Template handling
   - Common build operations

## Tasks (Aka Prompts)

1. Create Configuration System
```
- Create scripts/config.yaml with default settings
- Implement scripts/python/config.py to manage configuration
- Add environment variable support for overrides
- Update existing scripts to use configuration system
```

2. Reorganize Utils
```
- Split build_utils.py into logical modules in scripts/python/utils/
- Create __init__.py to expose key functionality
- Update imports in build.py and build_one_mod.py
```

3. Update Script Dependencies
```
- Add inline script metadata to all Python scripts
- Remove --with commands from batch files
- Verify dependencies work with uv run
```

4. Test Implementation
```
- Verify all scripts work with new structure
- Test configuration overrides
- Ensure build process works end-to-end
- Validate module imports and dependencies
### PowerShell Command Formatting
When testing scripts in PowerShell, use proper PowerShell syntax:
```powershell
# Wrong - using bash/cmd syntax:
cd some/path && ./script.bat

# Correct - using PowerShell syntax:
Push-Location some/path; ./script.bat; Pop-Location
```
```

## Additional Notes

- Use `uv init --script` to initialize script metadata
- Use `uv add --script` to declare dependencies
- Follow PEP 8 style guidelines
- Add comprehensive docstrings to all new modules
- Maintain backward compatibility
- Add error handling for missing configuration


