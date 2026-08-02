class_name StateMachine
extends Node

var current_state: State
var states: Dictionary[int, State] = {}


func init() -> void:
	var first_state: State = null

	for child in get_children():
		var state := child as State
		if state == null:
			continue

		states[state.get_state_id()] = state
		state.state_machine = self

		if first_state == null:
			first_state = state

	if first_state == null:
		return

	change_state(first_state)


func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter()


func change_state_by_id(state_id: int) -> void:
	if state_id == State.NO_TRANSITION:
		return

	if not states.has(state_id):
		push_error("No state registered for id %d under %s" % [state_id, owner.name])
		return

	change_state(states[state_id] as State)


func process(delta: float) -> void:
	change_state_by_id(current_state.process(delta))


func physics_process(delta: float) -> void:
	change_state_by_id(current_state.physics_process(delta))
