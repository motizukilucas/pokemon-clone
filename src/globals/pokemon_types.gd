class_name PokemonTypes
extends RefCounted

## These values are serialized into .tres files as plain integers, so they are
## part of the on-disk format. Only ever append new types with the next free
## value — renumbering or inserting silently changes the type of every species
## and move already saved, with no error and nothing visible in a diff.
enum Type {
	NONE = 0,
	NORMAL = 1, FIRE = 2, WATER = 3, ELECTRIC = 4, GRASS = 5,
	FIGHTING = 6, GROUND = 7, FLYING = 8, PSYCHIC = 9, GHOST = 10, DRAGON = 11,
}
