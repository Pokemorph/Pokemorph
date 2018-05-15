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

global.newPokemon = dex_id.Eevee;
global.newLevel = 1;

global.breedData = ds_grid_create(stats_breed.catch_rate+1, dex_id.done);
ds_grid_set_region(global.breedData, 0, 0, ds_grid_width(global.breedData), ds_grid_height(global.breedData), -1);
global.moveLists = ds_grid_create(80, dex_id.done);
ds_grid_set_region(global.moveLists, 0, 0, ds_grid_width(global.moveLists), ds_grid_height(global.moveLists), -1);
global.moves = ds_grid_create(move_stats.done, moves.done);
ds_grid_set_region(global.moves, 0, 0, ds_grid_width(global.moves), ds_grid_height(global.moves), -1);
global.moveEffects = ds_grid_create(5, 1);
ds_grid_set_region(global.moveEffects, 0, 0, ds_grid_width(global.moveEffects), ds_grid_height(global.moveEffects), -1);

global.experience[49] = 570; global.experience[48] = 561; global.experience[47] = 551;
global.experience[46] = 542; global.experience[45] = 532; global.experience[44] = 522;
global.experience[43] = 513; global.experience[42] = 503; global.experience[41] = 494;
global.experience[40] = 484; global.experience[39] = 474; global.experience[38] = 465;
global.experience[37] = 455; global.experience[36] = 446; global.experience[35] = 436;
global.experience[34] = 426; global.experience[33] = 417; global.experience[32] = 407;
global.experience[31] = 398; global.experience[30] = 388; global.experience[29] = 378;
global.experience[28] = 369; global.experience[27] = 359; global.experience[26] = 350;
global.experience[25] = 340; global.experience[24] = 330; global.experience[23] = 321;
global.experience[22] = 311; global.experience[21] = 302; global.experience[20] = 292;
global.experience[19] = 282; global.experience[18] = 273; global.experience[17] = 263;
global.experience[16] = 254; global.experience[15] = 244; global.experience[14] = 234;
global.experience[13] = 225; global.experience[12] = 215; global.experience[11] = 206;
global.experience[10] = 196; global.experience[9] = 186; global.experience[8] = 177;
global.experience[7] = 167; global.experience[6] = 158; global.experience[5] = 148;
global.experience[4] = 138; global.experience[3] = 129; global.experience[2] = 119;
global.experience[1] = 110; global.experience[0] = 100;