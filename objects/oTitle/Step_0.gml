/// @desc handle the state engine
// connect the dots in the animation sequence

if state == 0 {
	sprite_index = title_studio;
	image_alpha = 0;
	audio_play_sound(snd_joker, 10, false);
	state++;
} else if state == 1 {
	if image_alpha < 1		image_alpha += 0.05;
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
    buttons[5] = instance_create_depth(x+sprite_width/2, y, -10, oButtonTitle);
    button = instance_create_depth(x+sprite_width/2, y+440, -10, oTitleContinue);
    timer += 1/room_speed;
    state++;
} else if state == 4 {
    if mouse_check_button_pressed(mb_any) or oGameControl.any_key or keyboard_check(vk_anykey) {
        with button     instance_destroy();
        state++;
    }
} else if state == 5 {
    if image_alpha > 0.75 {
        image_alpha -= 0.01;
    } else {
        buttons[0] = instance_create_depth(1024, 336, -10, oButtonNew);
		buttons[1] = instance_create_depth(1024, 400, -10, oButtonTest);
		//buttons[1] = instance_create_depth(1024, 400, -10, oButtonTutorial);
		buttons[2] = instance_create_depth(1024, 464, -10, oButtonLoad);
		buttons[3] = instance_create_depth(1024, 528, -10, oButtonOptions);
		buttons[4] = instance_create_depth(1024, 592, -10, oButtonQuit);
        state++;
    }
}