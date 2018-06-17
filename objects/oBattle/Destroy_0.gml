/// @desc cleanup datastructures

if hud == true	instance_create_depth(0, 0, 0, oHUD);

//ds_list_destroy(player_team);
//ds_list_destroy(enemy_team);
ds_grid_destroy(actions_list);

if instance_exists(parent)	with parent wait(0.1);
set_music(song);

if instance_exists(menu)			with menu instance_destroy();
if instance_exists(text_box)		with text_box instance_destroy();

for (var i = 0; i < array_length_1d(combatants); i++) {
	if instance_exists(combatants[i].stats)		with combatants[i].stats	instance_destroy();
	if instance_exists(combatants[i])			with combatants[i]			instance_destroy();
}

//if instance_exists(player_stats)	with player_stats instance_destroy();
//if instance_exists(enemy_stats)		with enemy_stats instance_destroy();