/// @desc cleanup datastructures
// You can write your code in this editor

if hud == true	instance_create_depth(0, 0, 0, oHUD);

ds_list_destroy(player_team)
ds_list_destroy(enemy_team)
with menu instance_destroy();