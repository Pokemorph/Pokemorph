//-----------Player Idle State
//in this state, controls are enabled, and we can move and interact with objects

//speed controls
if oGameControl.run_state {
	move_speed = 6;
	animation_speed = 6/GAME_SPEED;
} else {
	move_speed = 3;
	animation_speed = 4/GAME_SPEED;
}

//find movement commands while not already moving
if is_moving == false {
	if oGameControl.up_key {
		move_y = -GRID_SIZE;
	} else if oGameControl.down_key {
		move_y = GRID_SIZE;
	} 
	if oGameControl.left_key {
		move_x = -GRID_SIZE;
	} else if oGameControl.right_key {
		move_x = GRID_SIZE;
	}
	if move_x != 0 or move_y != 0 {
		direction = point_direction(x, y, x+move_x, y+move_y);
		var tile_collision = find_tile_collision(x+move_x, y+move_y);
		var collision = place_meeting(x+move_x, y+move_y, parSolid) or tile_collision == collision_types.solid;
		if (collision) {
			move_x = 0;
			move_y = 0;
			animating = false;
		} else if (tile_collision == collision_types.water) {
			if !can_swim {	
				move_x = 0;	
				move_y = 0; 
				animating = false;	
			} else {
				is_moving = true;
				animating = true;
				speed_x = lengthdir_x(move_speed, direction);
				speed_y = lengthdir_y(move_speed, direction);
			}
		} else {
			is_moving = true;
			animating = true;
			speed_x = lengthdir_x(move_speed, direction);
			speed_y = lengthdir_y(move_speed, direction);
		}
	} else if animating == true		animating = false;
}


//run interaction scripting if the player is not moving
if oGameControl.interact_key and !is_moving {
	var x_dir = sign(lengthdir_x(4, facing*90) );	var y_dir = sign(lengthdir_y(4, facing*90) );
	
	var xx = x + 16 * x_dir;		var yy = y + 16 * y_dir;
	
	var interactable = instance_place(xx, yy, parSolid);
	var tile_interaction = find_tile_collision(xx, yy);
	if interactable {
		animating = false;
		state = player_talking_state;
		with interactable	event_user(events.talk);
	} else if tile_interaction == collision_types.water {
		//set the player state to fishing once the fishing engine is installed
	}
}


//now handle the actual moving code
if (is_moving == true)
{
	//follow the designated movement until we approach the target, then stop
	if abs(move_x) <= abs(speed_x) {
		x += move_x;
		move_x = 0;
	} else {
		x += speed_x;
		move_x -= speed_x;
	}
	if abs(move_y) <= abs(speed_y) {
		y += move_y;
		move_y = 0;
	} else {
		y += speed_y;
		move_y -= speed_y;
	}
	
	//when we stop, update tile, check wild battles, and tell the script we can move again
	if (move_x == 0 and move_y == 0) {
		is_moving = false;
		tile_x = floor(x/GRID_SIZE);
		tile_y = floor(y/GRID_SIZE);
		//check for grass tiles and wild battles here
		var tile_collision = find_tile_collision(x, y);
		if tile_collision == collision_types.grass {
			var encounter = irandom_range(1, 100);
			if encounter <= 10 {
				set_music("mus_wildBattle");
			}
		} else if oGameControl.music_name = "mus_wildBattle" {
			set_music("mus_pallet");
		}
	}
}
