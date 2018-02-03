/// @desc handle the state engine
// connect the dots in the animation sequence

if state == 0 {
	sprite_index = title_studio;
	image_alpha = 0;
	audio_play_sound(snd_joker, 10, false);
	state++;
} else if state == 1 {
	if image_alpha < 1		image_alpha += 0.2/GAME_SPEED;
	else if !audio_is_playing(snd_joker) {
        sprite_index = title_gamemaker;
        timer += 1/room_speed;
        if timer >= 10/room_speed {
            state++;
            timer = 0;
        }
    }
    if mouse_check_button_pressed(mb_any) or oGameControl.any_key or keyboard_check(vk_anykey) {
        image_alpha = 1;
        audio_stop_sound(snd_joker);
    }
} else if state == 2 {  //linger on gamemaker logo for a moment
    if timer < 2 {
        timer += 1/GAME_SPEED;
    } else if timer >= 2 {
        timer = 0;
        state++;
    }
} else if state == 3 {  //switch to game title
    audio_play_sound(mus_title, 10, true);
    sprite_index = title_background;
    button_title = instance_create_depth(x+sprite_width/2, y+8, -10, oButtonTitle);
    button_continue = instance_create_depth(x+sprite_width/2, y+440, -10, oTitleContinue);
    timer = 0;
    state++;
} else if state == 4 {
    if mouse_check_button_pressed(mb_any) or oGameControl.any_key or keyboard_check(vk_anykey) {
        instance_create_depth(x, y, depth, oTitleMenu);
		instance_destroy();
    }
}