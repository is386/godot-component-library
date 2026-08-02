class_name AimLine
extends Line2D

@onready var ray_cast: RayCast2D = $RayCast2D


func _physics_process(_delta: float) -> void:
	var local_target_position := get_local_mouse_position()

	ray_cast.position = position
	ray_cast.target_position = local_target_position - position

	var line_end := (
			to_local(ray_cast.get_collision_point())
			if ray_cast.is_colliding()
			else local_target_position
	)

	points = [Vector2.ZERO, line_end]
