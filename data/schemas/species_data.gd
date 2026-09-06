class_name SpeciesData
extends Resource

@export_group("Types")
## Primary type. Must never be NONE.
@export var type_1: PokemonTypes.Type = PokemonTypes.Type.NORMAL
## Secondary type. NONE means single-typed.
@export var type_2: PokemonTypes.Type = PokemonTypes.Type.NONE

@export_group("Base Stats")
@export_range(1, 255) var base_hp: int = 1
@export_range(1, 255) var base_attack: int = 1
@export_range(1, 255) var base_defense: int = 1
@export_range(1, 255) var base_sp_attack: int = 1
@export_range(1, 255) var base_sp_defense: int = 1
@export_range(1, 255) var base_speed: int = 1

@export_group("Abilities")
@export var abilities: Array[StringName] = []

@export_group("Learnset")
@export var moves: Dictionary = {}

func _init() -> void:
	assert(type_1 != PokemonTypes.Type.NONE, "SpeciesData.type_1 must not be NONE")
