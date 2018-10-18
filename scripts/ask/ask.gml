/// @function ask()
/// @description Ask player a question (keep answers short)
/// @argument "name"
/// @argument "text"
/// @argument "choice_1"
/// @argument ...


if !instance_exists(oDialog)     {
	var dialog = instance_create_depth(x, y, 10, oDialog);
	dialog.text[0] = argument[1];
	dialog.name = argument[0];
	dialog.input_timer = GAME_SPEED/4;
	dialog.parent = id;
	
	//now loop through all remaining arguments and feed them to the dialog box's choices array for use
	for ( var i = 0; i < argument_count-2; i++ ) {
		dialog.choices[i] = argument[2+i];
	}
	with dialog event_user(events.format_text);
}