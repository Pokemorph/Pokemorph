/// @description Initialize actor variables
event_inherited();
//image management
image_speed = 0;

state=0;
interact_state=0;
name = "Default";

dialog = noone;
dialog_page = 0;
text[0] = "Hello, Bay. This is a dialog box. Just to show you what dialog boxes can do.";
answer = -1;		//use this to track player answers to questions
//animation variables
animation_direction=1;
animation_speed = 4/game_get_speed(gamespeed_fps);
animation_length = 3;
animation_type = animate_type.yoyo;
animation_start = 0;
animating = false;
facing = directions.down;
direction = facing*90;
face_directions = 4;
current_frame = 1;
//sprite_walk = spr_willow_walk;

//movement variables
move_x = 0;
move_y = 0;
move_speed = 4;
is_moving = false;
speed_x = 0;
speed_y = 0;
x = tile_x*32//+(GRID_SIZE/2);
y = tile_y*32;