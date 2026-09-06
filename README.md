
Goal: to create several component scenes, to control pokemon aspects, such as its attributes, moves etc. So we can easily drag and drop components into a pokemon scene, allowing to create pokemon faster. Pokemon scene will be a base generic reusable scene across all pokemons, when creating a new pokemon we will only need to set attributes, spritesheet reference etc. Those pokemon can then be instantiated in the game.

Inspired in Pokemon FireRed, LeafGreen generation.


## Design Principle

Separate **species data** (shared by all Bulbasaur) from **instance data** (this specific Bulbasaur). Species data lives in a `Resource`; instance data lives in components on the Pokemon scene.


## Species Resource

Static data shared by all pokemon of the same species. Not a component.

- base stats (HP, Atk, Def, SpAtk, SpDef, Spe)
- types (1 or 2)
- possible abilities
- learnset (move IDs by level, TM, egg)
- growth rate (Erratic, Fast, Medium Fast, Medium Slow, Slow, Fluctuating)
- ev yield, catch rate, base exp


## Move Resource

One resource per move. All moves registered in a global dictionary keyed by move ID.

- id, name, element/type
- base power, accuracy, base pp
- category (Physical, Special, Status)


## Components

### StateComponent

Live pokemon state. Split into two concerns:

**Persistent** (survives battles):
- current hp, level, exp
- status (Burn, Freeze, Paralysis, Poison, BadlyPoisoned, Sleep)
- friendship

**Volatile** (resets after battle):
- stat stages (-6 to +6 per stat)
- confusion, flinch, leech seed, encore, etc.

### StatComponent

Computes actual stat values using the Gen 3 formula.

- ivs (0-31 per stat, rolled on catch)
- evs (0-252 per stat, 510 total)
- nature (25 natures, +10%/-10% to two stats)
- exposes `get_stat(stat_name)` combining base + iv + ev + nature + level

### MovesComponent

Active moves the pokemon currently knows (up to 4). Each slot tracks:

- move id
- current pp
- max pp (base pp × PP Up tier, 0-3)

Learnset lives on the SpeciesResource, not here.

### IdentityComponent

Metadata that makes each pokemon unique.

- nickname, species reference
- gender, shiny flag
- ability (which of the species' abilities)
- held item
- original trainer

### SpriteComponent

- front/back spritesheet references
- shiny variant toggle
- animation state (idle, attack, faint)


## Pokemon Scene

Base reusable scene that hosts all components as children. Creating a new pokemon = instantiate the scene, assign a SpeciesResource, and configure instance data (nickname, ivs, moves, etc.).


## Folder Structure

Hybrid component + feature layout. Component `.tscn` and `.gd` files are colocated in per-component folders. Resource schemas (code) are split from resource content (`.tres` data).

```
res://
├── addons/                    # third-party plugins
├── assets/                    # raw art/audio
│   ├── sprites/pokemon/
│   ├── sprites/ui/
│   └── audio/{bgm,sfx,cries}/
├── components/                # reusable component scenes (.tscn + .gd)
│   ├── state_component/
│   ├── stat_component/
│   ├── moves_component/
│   ├── identity_component/
│   └── sprite_component/
├── entities/
│   └── pokemon/               # pokemon.tscn — composes the components
├── data/
│   ├── schemas/               # species_data.gd, move_data.gd (extends Resource)
│   ├── species/               # bulbasaur.tres, charmander.tres...
│   ├── moves/                 # tackle.tres, ember.tres...
│   └── types/                 # type chart
├── scenes/
│   ├── battle/
│   ├── overworld/
│   └── ui/
├── src/
│   ├── autoload/              # GameState, EventBus, AudioManager
│   └── globals/               # enums, constants
└── project.godot
```

Conventions:
- `snake_case` filenames (Godot cross-platform requirement)
- one folder per component, `.tscn` + `.gd` colocated
- no monolithic `scripts/` folder
