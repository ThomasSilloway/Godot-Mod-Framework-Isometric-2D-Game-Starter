@echo off
cd /d %~dp0
cd ..
set PYTHONPATH=%CD%
uv run %~dp0\python\build_one_mod.py %*
