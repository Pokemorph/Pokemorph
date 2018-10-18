/// @desc Increment the text

if input_timer <= 0 {
    text_count += spd;
} else {
	input_timer--
	exit;
}
text_visible = string_copy(text[text_page], 1, round(text_count));

if oGameControl.interact_key and input_timer <= 0 {
    if text_count < string_length(text[text_page])   {
        text_count = string_length(text[text_page]);
        input_timer = GAME_SPEED/4;
        exit;
    } else if text_page < array_length_1d(text)-1 {
        text_page++;
        text_count = 0;
        text_visible = "";
        input_timer = GAME_SPEED/4;
        exit;
    } else {
		if instance_exists(parent)	with parent {
			wait(0);
		}
        instance_destroy();
    }
}

if array_length_1d(menu_array) > 0 {
	var click = noone;
	for (var i = 0; i < array_length_1d(choices); i++) {
		if menu_array[i+1].click == true	{
			click = i;
		}
	}
	
	if click != noone and input_timer <= 0 and text_count >= string_length(text[text_page]) {
		if instance_exists(parent)	with parent {
			answer = click;
			wait(0);
		}
        instance_destroy();
	}
}