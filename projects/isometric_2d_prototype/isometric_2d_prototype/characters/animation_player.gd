extends AnimatedSprite2D

var last_direction: Vector2 = Vector2(0, 1)  # Default looking down
var debug_enabled: bool = false  # Toggle for debug info
var debug_timer: float = 0.0  # Timer for debug prints
const DEBUG_PRINT_INTERVAL: float = 0.10  # Print debug info every second

func _ready() -> void:
	var player = get_parent()
	if player and player.has_signal("direction_changed"):
		player.direction_changed.connect(_on_direction_changed)

func _on_direction_changed(direction: Vector2) -> void:
	# If no movement, set to idle state
	if direction.length() == 0:
		_set_idle_animation()
		return
	
	# Store this as the last direction if moving
	last_direction = direction
	
	# Calculate angle in degrees from the vector (0 is to the right)
	var angle = fmod(rad_to_deg(direction.angle()) + 360.0, 360.0)
	
	# Choose animation based on angle ranges and start playing
	_set_direction_animation(angle)
	play()

func _set_direction_animation(angle: float) -> void:
	var anim_speed = 1.25

	if angle >= 337.5 or angle < 22.5:  # Right
		play("walk_right")
		flip_h = false
	elif angle >= 22.5 and angle < 67.5:  # Down-Right
		play("walk_down_right")
		flip_h = false
	elif angle >= 67.5 and angle < 112.5:  # Down
		play("walk_down")
		flip_h = false
		anim_speed = 1.0
	elif angle >= 112.5 and angle < 157.5:  # Down-Left
		play("walk_down_right")
		flip_h = true
	elif angle >= 157.5 and angle < 202.5:  # Left
		play("walk_right")
		flip_h = true
	elif angle >= 202.5 and angle < 247.5:  # Up-Left
		play("walk_up_right")
		flip_h = true
	elif angle >= 247.5 and angle < 292.5:  # Up
		play("walk_up")
		flip_h = false
		anim_speed = 1.0
	elif angle >= 292.5 and angle < 337.5:  # Up-Right
		play("walk_up_right")
		flip_h = false

	# Set animation speed
	speed_scale = anim_speed

	if debug_enabled:
		print_debug_animation_info()

func _set_idle_animation() -> void:
	# When not moving, keep the last direction's animation but pause it at first frame
	_set_direction_animation(fmod(rad_to_deg(last_direction.angle()) + 360.0, 360.0))
	set_frame(0)
	stop()
	if debug_enabled:
		print_debug_animation_info()

func _process(delta: float) -> void:
	# Only handle debug printing in _process now
	if debug_enabled:
		debug_timer += delta
		if debug_timer >= DEBUG_PRINT_INTERVAL:
			print_debug_animation_info()
			debug_timer = 0.0

# Debug function to print animation information
func print_debug_animation_info() -> void:
	var current_anim = animation
	var is_playing_state = is_playing()
	var playing_speed = get_playing_speed()
	
	print("==== Animation Debug Info ====")
	print("Animation: ", current_anim, " (Playing: ", is_playing_state, ")")
	print("Frame: ", frame, "/", sprite_frames.get_frame_count(current_anim) - 1, 
		  " Progress: ", frame_progress)
	print("Speed: ", playing_speed, " Flipped: ", "H=" + str(flip_h), " V=" + str(flip_v))
	print("============================")
