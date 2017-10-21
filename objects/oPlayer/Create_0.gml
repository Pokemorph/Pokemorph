/// @description Initialize Player Sprite

//setup our finite state engine
state = player_idle_state;

//animation variables
animation_direction=1;
animation_speed = 4/30;
animation_length = 3;
animation_type = ANIMATE_YOYO;
animation_start = 0;
animating = false;
facing = DOWN;
direction = facing*90;
face_directions = 4;
current_frame = 1;

//movement variables
move_x = 0;
move_y = 0;
move_speed = 4;
is_moving = false;
speed_x = 0;
speed_y = 0;
tile_x = floor(x/GRID_SIZE);
tile_y = floor(y/GRID_SIZE);
x = tile_x*32//+(GRID_SIZE/2);
y = tile_y*32;
can_swim = false;

//image variables
image_speed = 0;
depth_layer = 0;
