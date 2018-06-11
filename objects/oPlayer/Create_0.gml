/// @description Initialize Player Sprite and Data

event_inherited();
//setup our finite state engine
state = player_idle_state;
last_room = -1;
door_id = 0;

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

//trainer data
trainer_pic = battle_bay;
trainer_name = global.BayName;
ai_script = battle_control_player;
pose = battle_poses.back;
pokemon = [];
for ( var i = 5; i >= 0; i-- ) {
	pokemon[i] = noone;
}
pokemon[0] = new_pokemon(dex_id.Eevee_nm, 8);
pokemon[0].hp_cur -= 10;
pokemon[0].nickname = "Fluffee";
pokemon[1] = new_pokemon(dex_id.Eevee, 5);
pokemon[1].nickname = "Sandee";