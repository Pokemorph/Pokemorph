/// @desc initialize battle data
// Call this event from script after the battle data has been fed in, to make use of it

ppic = ds_grid_get(global.breedData, stats_breed.picture, pmon.breed_ref);
epic = ds_grid_get(global.breedData, stats_breed.picture, emon.breed_ref);