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
		if instance_exists(cutscene)	with cutscene {
			interact_state++;
			alarm[1] = 1;
		}
        instance_destroy();
    }
}