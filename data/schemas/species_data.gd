class_name SpeciesData
extends Resource

@export_group("Identity")
## Stable lookup key. Never shown to the player, never changes.
## Saves and learnsets reference species by this, not by resource path.
@export var id: StringName = &""
## Species name shown to the player. Not the nickname a player gives a caught
## pokemon — that is instance data on IdentityComponent.
@export var display_name: String = ""

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
## Move ids keyed by the level the pokemon learns them at. A level can teach
## more than one move, so each value is an array.
@export var level_up_moves: Dictionary = {}

func _init() -> void:
	assert(type_1 != PokemonTypes.Type.NONE, "SpeciesData.type_1 must not be NONE")
