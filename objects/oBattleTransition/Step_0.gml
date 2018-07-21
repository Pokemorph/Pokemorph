/// @description manage animation sequence
// You can write your code in this editor
if image_alpha < 1 {
	image_alpha += fade_step;
	if instance_exists(oBattle) and image_alpha >= 1	{
		image_alpha = 1;
		oBattle.visible = true;
	}
} else if image_alpha == 1 {
	if x == back_x and ball_scale == 1 and ball_angle == 0 { //if our position is correct, add to sep and exit
		separation += step_size;
		if separation >= 300	instance_destroy();
		exit;
	}
	
	if x+step_size < back_x { //if we were moved left, now move right
		x += step_size;
	} else if x-step_size > back_x { //if we were moved right, now move back
		x -= step_size;
	} else { //if we're less than one step away from our target, fix position
		x = back_x;
	}

	if ball_scale+scale_step_size < 1 {
		ball_scale += scale_step_size;
	} else if ball_scale-scale_step_size > 1 {
		ball_scale -= scale_step_size;
	} else {
		ball_scale = 1;
	}

	if ball_angle+spin_step_size < 0 {
		ball_angle += spin_step_size;
	} else if ball_angle+spin_step_size > 0 {
		ball_angle -= spin_step_size;
	} else {
		ball_angle = 0;
	}
}