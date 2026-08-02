class_name ShakingCamera
extends Camera2D

@onready var shaking_component: ShakingComponent = $ShakingComponent


func screen_shake(intensity: float, time: float) -> void:
	shaking_component.shake(intensity, time)
