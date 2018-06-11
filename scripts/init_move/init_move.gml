/// @function init_move()
/// @description combine arguments into a move entry
/// @argument dex_id
/// @argument "name"
/// @argument sprite_ally
/// @argument sprite_enemy
/// @argument sound
/// @argument pwr
/// @argument priority
/// @argument type
/// @argument special
/// @argument accuracy
/// @argument effect_chance
/// @argument effect
/// @argument description

var poke = argument[0];

ds_grid_set(global.moves, move_stats.name, poke, argument[1]);
ds_grid_set(global.moves, move_stats.sprite_ally, poke, argument[2]);
ds_grid_set(global.moves, move_stats.description, poke, argument[11]);
ds_grid_set(global.moves, move_stats.sprite_enemy, poke, argument[3]);
ds_grid_set(global.moves, move_stats.sound, poke, argument[4]);
ds_grid_set(global.moves, move_stats.pwr, poke, argument[5]);
ds_grid_set(global.moves, move_stats.priority, poke, argument[6]);
ds_grid_set(global.moves, move_stats.type, poke, argument[7]);
ds_grid_set(global.moves, move_stats.special, poke, argument[8]);
ds_grid_set(global.moves, move_stats.accuracy, poke, argument[9]);
ds_grid_set(global.moves, move_stats.effect_chance, poke, argument[10]);
ds_grid_set(global.moves, move_stats.effect, poke, argument[11]);