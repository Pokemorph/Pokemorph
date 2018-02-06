/// @desc setup title menu

event_inherited();
set_music("mus_title");
state = 0;
buttons = [noone, noone, noone, noone, noone, noone];
buttons[5] = instance_create_depth(x+sprite_width/2, y+8, depth-1, oButtonTitle);
image_alpha = 1;