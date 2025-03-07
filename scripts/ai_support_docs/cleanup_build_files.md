The previous agent just converted some build batch files into python and did a great job. There's some cleanup work to do though.

1. Each batch file is using a bunch of --with commands to install dependencies. I think these should be specified inside the python script instead.

2. The godot path in build_utils.py is hardcoded. Let's make this a config variable in the scripts folder.

3. build_utils.py is a bit too crowded. Let's move the functions into their own separate files in the scripts\python\utils folder

Note: Used this prompt to create the spec!

