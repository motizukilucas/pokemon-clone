
Goal: to create several component scenes, to control pokemon aspects, such as its attributes, moves etc. So we can easily drag and drop components into a pokemon scene, allowing to create pokemon faster. Pokemon scene will be a base generic resuable scene accross all pokemons, when creating a new pokemon we will only need to set attributes, spritesheet reference etc. Those pokemon can then be instantiated in the game.


## Pokemon

    - StateComponent
    - StatComponent
    - MovesComponent


### State Component

Controlls live state

current hp, status, level

### Stat Component

Controls stats

base stats, hp without modifier, attack without modifier


### Moves Components

Controls pokemons moves

Active moves

List of learnable moves. This is a vector with IDs of all learnable moves.

There will be a dictionary with all existing moves in the game, that includes move id, name, element, basepower etc.
