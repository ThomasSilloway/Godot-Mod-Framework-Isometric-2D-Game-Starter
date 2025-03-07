@echo off
cd /d %~dp0
cd ..
set PYTHONPATH=%CD%
uv run scripts/python/build.py %*
