/// @desc initialize battle data
// Call this event from script after the battle data has been fed in, to make use of it

ppic = ds_grid_get(global.breedData, stats_breed.picture, pmon.breed_ref);
epic = ds_grid_get(global.breedData, stats_breed.picture, emon.breed_ref);
if instance_exists(player_stats)	{
	player_stats.active_morph = pmon;
} else	{ //x = 400; y = 160;
	player_stats = instance_create_depth(1023, 440, depth, oBattleStats);
	player_stats.active_morph = pmon;
}
if instance_exists(enemy_stats)		{
	enemy_stats.active_morph = emon;
} else {
	enemy_stats = instance_create_depth(400, 200, depth, oBattleStats);
	enemy_stats.active_morph = emon;
}

if instance_exists(menu)	{
	menu.active_morph = pmon;
};