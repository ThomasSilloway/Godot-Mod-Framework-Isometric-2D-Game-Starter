extends Node

func parse_file(path: String) -> Variant:
	if not FileAccess.file_exists(path):
		push_warning("YAML Parser: File not found - " + path)
		return null
		
	var file = FileAccess.open(path, FileAccess.READ)
	if not file:
		push_error("YAML Parser: Failed to open file - " + path)
		push_error("YAML Parser: Error code - " + str(FileAccess.get_open_error()))
		return null
		
	var content = file.get_as_text()
	if content.is_empty():
		push_error("YAML Parser: File is empty " + path)
		return null
		
	var result = {}
	var current_key = ""
	var in_list = false
	
	while not file.eof_reached():
		var line = file.get_line().strip_edges()
		
		# Skip empty lines and comments
		if line.is_empty() or line.begins_with("#"):
			continue
			
		# Check if this is a key
		if line.ends_with(":"):
			current_key = line.substr(0, line.length() - 1).strip_edges()
			result[current_key] = []
			in_list = true
			continue
			
		# If we're in a list and line starts with "-", it's a list item
		if in_list and line.begins_with("- "):
			var value = line.substr(2).strip_edges()
			result[current_key].append(value)
	
	file.close()
	
	if result.is_empty():
		push_warning("YAML Parser: No valid data found in file " + path)
		return null
	
	return result 
