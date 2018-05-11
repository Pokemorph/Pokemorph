/// @description Initialize Player Sprite and Data

//setup our finite state engine
state = player_idle_state;

//animation variables
animation_direction=1;
animation_speed = 4/30;
animation_length = 3;
animation_type = animate_type.yoyo;
animation_start = 0;
animating = false;
facing = directions.down;
direction = facing*90;
face_directions = 4;
current_frame = 1;

//movement variables
move_x = x;
move_y = y;
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
global.newLevel = 5;
global.newPokemon = dex_id.Bulbasaur;
pokemon1 = instance_create_depth(0, 0, 0, parPokemon);
pokemon1.hp_cur -= 10;
pokemon1.nickname = "Bulb";
global.newPokemon = dex_id.Ivysaur;
pokemon2 = instance_create_depth(0, 0, 0, parPokemon);
pokemon3 = instance_create_depth(0, 0, 0, parPokemon);;
pokemon4 = instance_create_depth(0, 0, 0, parPokemon);;
pokemon5 = instance_create_depth(0, 0, 0, parPokemon);;
pokemon6 = instance_create_depth(0, 0, 0, parPokemon);;