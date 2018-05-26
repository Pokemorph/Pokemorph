/// @desc cleanup datastructures
// You can write your code in this editor

if hud == true	instance_create_depth(0, 0, 0, oHUD);

//ds_list_destroy(player_team);
//ds_list_destroy(enemy_team);

if instance_exists(menu)	with menu instance_destroy();
if instance_exists(text_box)	with text_box instance_destroy();