class_name MovesComponent
extends Node

## The moves this pokemon currently knows. The learnset it draws from lives on
## SpeciesData.

const MAX_SLOTS := 4

var _slots: Array[MoveSlot] = []


func initialize(moves: Array[MoveData]) -> void:
	_slots.clear()
	for move in moves:
		learn(move)


func slot_count() -> int:
	return _slots.size()


func get_slot(index: int) -> MoveSlot:
	return _slots[index] if index >= 0 and index < _slots.size() else null


func is_full() -> bool:
	return _slots.size() >= MAX_SLOTS


func knows(move: MoveData) -> bool:
	for slot in _slots:
		if slot.move != null and slot.move.id == move.id:
			return true
	return false


## False when all four slots are taken — the caller picks what to forget.
func learn(move: MoveData) -> bool:
	if move == null or is_full() or knows(move):
		return false
	_slots.append(MoveSlot.new(move))
	return true


## Overwrites an occupied slot, discarding the move that was there.
func replace(index: int, move: MoveData) -> bool:
	if move == null or get_slot(index) == null or knows(move):
		return false
	_slots[index] = MoveSlot.new(move)
	return true


## False when the slot is empty or out of PP.
func use(index: int) -> bool:
	var slot := get_slot(index)
	if slot == null or slot.current_pp <= 0:
		return false
	slot.current_pp -= 1
	return true


func restore_pp() -> void:
	for slot in _slots:
		slot.current_pp = slot.max_pp()
