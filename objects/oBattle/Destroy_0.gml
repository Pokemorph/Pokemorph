/// @desc cleanup datastructures
// You can write your code in this editor

if hud == true	instance_create_depth(0, 0, 0, oHUD);

//ds_list_destroy(player_team);
//ds_list_destroy(enemy_team);

set_music(song);

if instance_exists(menu)			with menu instance_destroy();
if instance_exists(text_box)		with text_box instance_destroy();

if instance_exists(player_stats)	with player_stats instance_destroy();
if instance_exists(enemy_stats)		with enemy_stats instance_destroy();