/// @description Increment the text
// You can write your code in this editor
if input_timer <= 0 and text[0] != "" {
    text_count += spd;
} else {
	input_timer--
	exit;
}

if text[0] = "player"	{ //while the active page is set to default, display a "what will you do" message
	var act = noone;
	with parent		act = combatants[active_combatant].active_pokemon;
	text_visible = "What will " + string(act.nickname) + " do?";
} else		text_visible = string_copy(text[text_page], 1, round(text_count));

if oGameControl.interact_key and input_timer <= 0 {
    if text_count < string_length(text[text_page])   {
        text_count = string_length(text[text_page]);
        input_timer = GAME_SPEED/4;
    } else if text_page < array_length_1d(text)-1 {
        text_page++;
        text_count = 0;
        text_visible = "";
        input_timer = GAME_SPEED/4;
    } else {
		text_page = 0;
		text_count = 0;
		text_visible = "";
		input_timer = GAME_SPEED/4;
		text = 0; text = []; text[0] = "";
    }
}