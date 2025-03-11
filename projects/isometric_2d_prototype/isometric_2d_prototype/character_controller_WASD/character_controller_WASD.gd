extends CharacterBody2D

@export var speed: float = 200.0

# Isometric movement constants
const ISOMETRIC_X_FACTOR: float = 1.0  # Right component
const ISOMETRIC_Y_FACTOR: float = 0.5  # Down component

signal direction_changed(direction: Vector2)

var _last_angle: float = -1  # Track the last angle to detect actual changes

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
		
		 # Calculate current angle
		var current_angle = fmod(rad_to_deg(input_direction.angle()) + 360.0, 360.0)
		
		# Only emit if the angle has changed or we're starting movement
		if abs(current_angle - _last_angle) > 0.01:  # Small epsilon for float comparison
			direction_changed.emit(input_direction)
			_last_angle = current_angle
	else:
		# If we stopped moving and we weren't already stopped
		if _last_angle != -1:
			direction_changed.emit(Vector2.ZERO)
			_last_angle = -1
	
	# Set velocity and move
	velocity = input_direction * speed * delta * 1000
	velocity.y *= ISOMETRIC_Y_FACTOR
	move_and_slide()
