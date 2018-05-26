/// @description draw self and combatants
// You can write your code in this editor

draw_self();
if sprite_exists(epic)	draw_sprite(epic, battle_poses.front, enemy_x, enemy_y);
if sprite_exists(ppic)	draw_sprite(ppic, battle_poses.back, player_x, player_y);
