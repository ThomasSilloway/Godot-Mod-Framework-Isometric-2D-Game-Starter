extends Node2D

var _click_positions: Array[Vector2] = []

func add_click_position(pos: Vector2) -> void:
	_click_positions.append(pos)
	queue_redraw()

func _draw() -> void:
	for pos in _click_positions:
		var size := Vector2(10, 10)
		var rect := Rect2(pos - size/2, size)
		draw_rect(rect, Color.RED, false)
