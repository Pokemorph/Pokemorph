/// @desc Draw Fadeout

if target_alpha > 0 { //initial fadeout
	if image_alpha < target_alpha { //if current alpha is less than target, raise it slightly
		image_alpha += fade_step;
	} else {
		image_alpha = target_alpha;
		target_alpha = 0;
	}
} else if target_alpha <= 0 { //switch to fadein
	if image_alpha > 0 {
		image_alpha -= fade_step;
	} else {
		instance_destroy();
	}
}

draw_sprite_ext(battle_transition_back, 0, 810, 400, 1, 1, 0, fade_color, image_alpha); //draw top
draw_sprite_ext(battle_transition_back, 1, 810, 400, 1, 1, 0, fade_color, image_alpha); //draw bottom

