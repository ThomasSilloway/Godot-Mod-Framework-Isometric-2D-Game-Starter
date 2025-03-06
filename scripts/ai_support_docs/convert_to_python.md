I think the code in the #file:build_one_mod.bat and #file:build.bat is getting a bit too complex and hard to reach for a batch file. Let's go ahead and convert them into python scripts. We should still have a batch file to execute the python scripts though. They should share as much code as possible within python. the new batch files should be very minimal. 

Make sure to use `uv` 

Note: Used this prompt to create the spec!

Please create a new markdown file in #folder:ai_support_docs in a subfolder called convert_batch_to_python. It should use the same format as #file:spec.md and include instructions for an AI Agent to fulfill the request in #file:convert_to_python.md while also using the #file:run-godot-game.py as a sample file and the #file:uv-usage.md as the documentation for how UV package works