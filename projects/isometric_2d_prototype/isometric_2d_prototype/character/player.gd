extends CharacterBody2D

@export var speed: float = 200.0

# Isometric movement constants
const ISOMETRIC_X_FACTOR: float = 1.0  # Right component
const ISOMETRIC_Y_FACTOR: float = 0.5  # Down component

signal direction_changed(direction: Vector2)

# Movement handling
func _physics_process(delta: float) -> void:
	# Get input direction
	var input_direction = Vector2.ZERO
	
	# Combine WASD and Arrow key inputs
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		input_direction.x += 1
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		input_direction.x -= 1
	if Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_S):
		input_direction.y += 1
	if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W):
		input_direction.y -= 1
	
	# Normalize to prevent faster diagonal movement
	if input_direction.length() > 0:
		input_direction = input_direction.normalized()
		
		# Emit signal for animation changes
		direction_changed.emit(input_direction)
	
	# Convert input to isometric movement vector
	var isometric_direction = convert_to_isometric(input_direction)
	
	# Set velocity and move
	velocity = isometric_direction * speed
	move_and_slide()

# Convert standard input direction to isometric movement vector
func convert_to_isometric(direction: Vector2) -> Vector2:
	var iso_direction = Vector2.ZERO
	
	# Isometric conversion - right/left movement affects both X and Y
	iso_direction.x = direction.x * ISOMETRIC_X_FACTOR - direction.y * ISOMETRIC_X_FACTOR
	# Up/down affects primarily Y axis but with adjusted factor
	iso_direction.y = direction.x * ISOMETRIC_Y_FACTOR + direction.y * ISOMETRIC_Y_FACTOR
	
	return iso_direction
