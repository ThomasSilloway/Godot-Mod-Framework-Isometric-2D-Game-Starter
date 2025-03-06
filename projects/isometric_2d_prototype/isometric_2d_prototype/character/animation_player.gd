extends AnimatedSprite2D

# Track the last direction for idle state
var last_direction: Vector2 = Vector2(0, 1)  # Default looking down

func _ready() -> void:
	# Connect to the direction_changed signal from the player script
	var player = get_parent()
	if player and player.has_signal("direction_changed"):
		player.direction_changed.connect(_on_direction_changed)

# Update animation based on movement direction
func _on_direction_changed(direction: Vector2) -> void:
	if direction.length() == 0:
		# If no movement, keep last direction's animation
		return
	
	# Store this as the last direction if moving
	last_direction = direction
	
	# Calculate angle in degrees from the vector (0 is to the right)
	var angle = rad_to_deg(direction.angle())
	
	# Adjust angle to match the game's orientation (negative Y is up)
	angle = fmod(angle + 360.0, 360.0)
	
	# Choose animation based on angle ranges
	if angle >= 315 or angle < 45:  # Right
		play("walk_090")
		flip_h = false
	elif angle >= 45 and angle < 135:  # Down
		play("walk_180")
		flip_h = false
	elif angle >= 135 and angle < 225:  # Left
		# For left direction, flip the right-facing sprite horizontally
		play("walk_090")
		flip_h = true
	elif angle >= 225 and angle < 315:  # Up
		play("walk_000")
		flip_h = false

# Set animation to idle when not moving
func _process(_delta: float) -> void:
	var player = get_parent()
	if player and player.velocity.length() == 0:
		# When not moving, keep the last direction's animation but pause it at first frame
		_on_direction_changed(last_direction)
		set_frame(0)
		stop()
