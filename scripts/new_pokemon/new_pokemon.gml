/// @function new_pokemon()
/// @description returns a new pokemon of the specified breed and level
/// @argument breed_id
/// @argument level

global.newPokemon = argument0;
global.newLevel = argument1;

var new = instance_create_depth(0,0,0, oPokemon);

return new;