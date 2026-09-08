class_name MoveData
extends Resource

## In Gen 3 the physical/special split is derived from the move's type, not
## stored per move. This field encodes the Gen 3 result for each move so the
## damage formula can read it directly instead of re-deriving it from the type.
##
## Serialized into .tres as a plain integer, so these values are part of the
## on-disk format — append only, never renumber. See PokemonTypes.Type.
enum Category { PHYSICAL = 0, SPECIAL = 1, STATUS = 2 }

@export_group("Identity")
## Stable lookup key. Never shown to the player, never changes.
## Learnsets and MovesComponent slots reference moves by this, not by resource path.
@export var id: StringName = &""
## Move name shown to the player.
@export var display_name: String = ""

@export_group("Battle")
@export var type: PokemonTypes.Type = PokemonTypes.Type.NORMAL
@export var category: Category = Category.PHYSICAL
## 0 for status moves, which deal no damage.
@export_range(0, 250) var power: int = 0
## 0 means the move bypasses the accuracy check and always hits.
@export_range(0, 100) var accuracy: int = 100
## PP before any PP Up is applied. MovesComponent tracks the boosted maximum.
@export_range(1, 40) var base_pp: int = 35
## Higher goes first regardless of Speed.
@export_range(-7, 7) var priority: int = 0
