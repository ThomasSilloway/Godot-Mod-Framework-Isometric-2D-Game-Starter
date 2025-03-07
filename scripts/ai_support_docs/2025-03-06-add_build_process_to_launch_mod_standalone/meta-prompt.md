Using the existing build process as a starting point, I want to add a new feature. I want to be able to use the new export setting for isometric_2d_prototype called `Windows Executable` in export_settings.cfg. This will allow us to build a standalone version of the game that we can run without building all of the mods and the startup package.

It should do the same thing that build.bat does where it runs the window in the foreground and pipes the log output to the same batch file that ran it.

I'm not sure what the new batch file should be called, but we need it in a similar structure to `build_one_mod.bat` where it takes the mod name as an argument. The new batch file should be called `build_standalone.bat` and it should take the mod name as an argument. 