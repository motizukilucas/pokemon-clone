class_name SpriteComponent
extends Sprite2D

## Renders the species sprite. Front/back facing and shiny variants come later.


func initialize(species: SpeciesData) -> void:
	texture = species.sprite
