/// @description check for start point
// check for existence of doors in this room
if instance_exists(parDoor) { //we found a door
	with parDoor { //inside each instance of parDoor, compare room values with player
		if next_room == other.last_room and door_id == other.door_id {
			other.x = x;
			other.y = y;
			other.last_room = room;
			other.direction = direction;
			image_index = image_number-1;
			solid = false;
			event_user(0);
		}
	}
	is_moving = true;
	move_x = sign(lengthdir_x(GRID_SIZE, direction)) * GRID_SIZE;
	move_y = sign(lengthdir_y(GRID_SIZE, direction)) * GRID_SIZE;
	speed_x = lengthdir_x(move_speed, direction);
	speed_y = lengthdir_y(move_speed, direction);
}