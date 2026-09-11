class_name MoveSlot
extends Resource

## One of the four moves a pokemon knows, plus its PP state.

const MAX_PP_UPS := 3

@export var move: MoveData
@export var current_pp: int = 0
@export_range(0, MAX_PP_UPS) var pp_ups: int = 0


func _init(p_move: MoveData = null, p_pp_ups: int = 0) -> void:
	move = p_move
	pp_ups = p_pp_ups
	current_pp = max_pp()


## Gen 3: each PP Up adds a fifth of the move's base PP, rounded down.
func max_pp() -> int:
	if move == null:
		return 0
	return move.base_pp + (move.base_pp / 5) * pp_ups
