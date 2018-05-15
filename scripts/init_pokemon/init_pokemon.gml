/// @function init_pokemon()
/// @description combine arguments into a pokemon breed entry
/// @argument dex_id
/// @argument "name"
/// @argument "species"
/// @argument height
/// @argument weight
/// @argument sprite
/// @argument picture
/// @argument female
/// @argument type1
/// @argument type2
/// @argument hp
/// @argument atk
/// @argument def
/// @argument spatk
/// @argument spdef
/// @argument spd
/// @argument catch
/// @argument flavor

var i = argument[0];

ds_grid_set(global.breedData, stats_breed.name, i, argument[1]);
ds_grid_set(global.breedData, stats_breed.species, i, argument[2]);
ds_grid_set(global.breedData, stats_breed.flavor_text, i, argument[17]);
ds_grid_set(global.breedData, stats_breed.height, i, argument[3]);
ds_grid_set(global.breedData, stats_breed.weight, i, argument[4]);
ds_grid_set(global.breedData, stats_breed.sprite, i, argument[5]);
ds_grid_set(global.breedData, stats_breed.picture, i, argument[6]);
ds_grid_set(global.breedData, stats_breed.sex, i, argument[7]);
ds_grid_set(global.breedData, stats_breed.type1, i, argument[8]);
ds_grid_set(global.breedData, stats_breed.type2, i, argument[9]);
ds_grid_set(global.breedData, stats_breed.hit_points, i, argument[10]);
ds_grid_set(global.breedData, stats_breed.attack, i, argument[11]);
ds_grid_set(global.breedData, stats_breed.defense, i, argument[12]);
ds_grid_set(global.breedData, stats_breed.special_attack, i, argument[13]);
ds_grid_set(global.breedData, stats_breed.special_defense, i, argument[14]);
ds_grid_set(global.breedData, stats_breed.spd, i, argument[15]);
ds_grid_set(global.breedData, stats_breed.catch_rate, i, argument[16]);