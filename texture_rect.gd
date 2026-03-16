extends TextureRect

var dragging: bool = false
var drag_offset: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO
var prev_mouse_pos: Vector2 = Vector2.ZERO

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				drag_offset = global_position - get_global_mouse_position()
				velocity = Vector2.ZERO
				prev_mouse_pos = get_global_mouse_position()
			else:
				dragging = false

	if event is InputEventMouseMotion:
		if dragging:
			velocity = get_global_mouse_position() - prev_mouse_pos
			prev_mouse_pos = get_global_mouse_position()

			var new_pos = get_global_mouse_position() + drag_offset
			var screen = get_viewport_rect().size
			var obj_size = size
			new_pos.x = clamp(new_pos.x, 0, screen.x - obj_size.x)
			new_pos.y = clamp(new_pos.y, 0, screen.y - obj_size.y)
			global_position = new_pos

func _process(delta: float) -> void:
	if not dragging:
		global_position += velocity * 10 * delta

		var screen = get_viewport_rect().size
		var obj_size = size

		if global_position.x <= 0:
			global_position.x = 0
			velocity.x *= -1

		if global_position.x >= screen.x - obj_size.x:
			global_position.x = screen.x - obj_size.x
			velocity.x *= -1

		if global_position.y <= 0:
			global_position.y = 0
			velocity.y *= -1

		if global_position.y >= screen.y - obj_size.y:
			global_position.y = screen.y - obj_size.y
			velocity.y *= -1

		velocity *= 1
