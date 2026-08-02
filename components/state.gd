class_name State
extends Node

const NO_TRANSITION: int = -1

var state_machine: StateMachine


func get_state_id() -> int:
	push_error("State '%s' did not override get_state_id()" % name)
	return NO_TRANSITION


func enter() -> void:
	pass


func exit() -> void:
	pass


func process(_delta: float) -> int:
	return NO_TRANSITION


func physics_process(_delta: float) -> int:
	return NO_TRANSITION
