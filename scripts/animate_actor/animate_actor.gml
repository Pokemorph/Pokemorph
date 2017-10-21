///animate_actor()

/*
  This script will allow me to animate multi-directional sprites, both cycle and yoyo,
  in one line of code
*/

//capture the animation length
//if face_directions == 0		face_directions = 1;
//animation_length = image_number/face_directions;
//should capture the value 3 for 4-directional yoyo animations
//commenting this section out to allow multiple animations in the same sprite

//check for the end of the animation cycle
if animation_type == animate_type.yoyo {
	if current_frame + (animation_speed*animation_direction) > animation_length {
	    animation_direction = -1;
	} else if current_frame + (animation_speed*animation_direction) < 1 {
	    animation_direction = 1;
	} else      {//if we aren't at the end of the animation, increment frame
	    current_frame += animation_speed*animation_direction;
	}
} else {
	if current_frame + (animation_speed*animation_direction) >= animation_length {
		if animation_type == animate_type.loop {
		    current_frame = 0;
		}
	} else {
		current_frame += animation_speed
	}
}


//facing = 0-3 to represent four directions
facing = round(direction/90);
while facing > 3       facing -=4;
while facing < 0       facing += 4;

//if actor says not to animate, automatically go to the stop frame
if animating = false {
    animation_direction = 1;
    if animation_type = animate_type.yoyo {
        //if it's a yoyo animation, stop in the neutral middle frame
		current_frame = round(animation_length/2);
    } else if animation_type = animate_type.loop {
        //if it's a loop, stop on the neutral first frame
		current_frame = 1;
	} else {
		//if it's a one-time motion, stop on the last frame
		current_frame = animation_length;
	}
}

//determine the sprite image index to use, factoring in current frame and direction
image_index = round(current_frame) + (animation_length*facing) - 1 + animation_start;