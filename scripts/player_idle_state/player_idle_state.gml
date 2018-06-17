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
		//direction tells our sprite which way to face
		direction = point_direction(x, y, x+move_x, y+move_y);
		//tile_collision returns an enum value with the collision type
		var tile_collision = find_tile_collision(x+move_x, y+move_y);
		
		//objects derived from parSolid may block us or allow us to pass, so find one and ask it if solid
		//note that without returning and then checking an array, only one solid in the space will answer
		//so let's try not to build solid objects on top of each other
		var collision = 0; var obj = instance_place(x+move_x, y+move_y, parSolid); 
		if instance_exists(obj) {
			if obj.solid == true	collision = 1; //this value tells the script that a solid object has been found
			else					collision = -1; //this one tells us a NON-solid object has been found
		}
		
		//now we can check both object and tile collisions
		if collision == -1 { //if an object in our path has been set to non-solid, ignore all other collisions and move
			is_moving = true;
			animating = true;
			speed_x = lengthdir_x(move_speed, direction);
			speed_y = lengthdir_y(move_speed, direction);
		} else if collision == 1 or tile_collision == collision_types.solid { //if a solid object or tile is there, stop
			move_x = 0;
			move_y = 0;
			animating = false;
		} else if tile_collision == collision_types.water { //if there's water, try to swim; if we can't swim, stop
			if !can_swim {	
				move_x = 0;	
				move_y = 0; 
				animating = false;	
			} else { //if we can swim, start swimming
				//change Bay's sprite here (missing sprite)
				is_moving = true;
				animating = true;
				speed_x = lengthdir_x(move_speed, direction);
				speed_y = lengthdir_y(move_speed, direction);
			}
		} else { //if there are no solid objects or tiles, and no water, make the move
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
	
	var xx = x + GRID_SIZE * x_dir;		var yy = y + GRID_SIZE * y_dir;
	
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
	
	//when we stop, perform all checks and tell the script we can move again
	if (move_x == 0 and move_y == 0) {
		//update tile location and let game know we can move again
		is_moving = false;
		tile_x = floor(x/GRID_SIZE);
		tile_y = floor(y/GRID_SIZE);
		
		//check for doors with teleport locations
		var door = instance_place(x, y, parDoor);
		if instance_exists(door) and room_exists(door.next_room) { //we found a door and it has a teleport
			if door.next_room = room { //this door teleports within the current room,
				//so we'll grab the id of the door it's going to and teleport there
				last_room = room;
				door_id = door.door_to;
				room_goto(door.next_room);
				exit;
			} else { //this door teleports to a new room,
				//so grab the door data and teleport
				last_room = room;
				door_id = door.door_id;
				room_goto(door.next_room);
				exit;
			}
		}
		
		//check for beds
		var bed = instance_place(x, y, oBed);
		if instance_exists(bed)	with bed event_user(1);
		
		//check for grass tiles here to generate wild battles
		//check this after looking for doors so doors placed on grass tiles will still function
		var tile_collision = find_tile_collision(x, y);
		if tile_collision == collision_types.grass {
			var encounter = irandom_range(1, 100);
			if encounter <= 10 {
				var rand = irandom_range(0, array_length_1d(global.wildList)-1 );
				var lvl = irandom_range(global.min_level, global.max_level);
				var poke = global.wildList[rand];
				wild_battle(terrain.field, "mus_wildBattle", new_pokemon(poke, lvl) );
			}
		}
	}
}
