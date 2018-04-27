/// @desc setup globals and position the lights

global.BayName = "Bay";
global.EeveeName = "Eevee";
global.WillowName = "Willow";
global.ReedName = "Reed";
global.OakName = "Oak";
global.AngelicaName = "Angelica";
global.DamienName = "Damien";

image_speed = 0;
image_index = 0;
alarm[0] = 1;
run_state = 0;

global.newPokemon = global.EeveeName;
global.newLevel = 1;

global.breedData = ds_grid_create(stats_breed.catch_rate+1, dex_id.Mew+1);
global.moveLists = ds_grid_create(80, 150);
global.moves = ds_grid_create(12, 10);
global.moveEffects = ds_grid_create(5, 1);