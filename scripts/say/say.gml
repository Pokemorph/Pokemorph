/// @function say()
/// @description Open dialog box
/// @argument "name"
/// @argument "text"


if !instance_exists(oDialog)     {
    //ai_lookat(oPlayer);
	//interact_state++;
    var dialog = instance_create_depth(x, y, 10, oDialog);
    dialog.text[0] = argument1;
	dialog.name = argument0;
	dialog.input_timer = GAME_SPEED/4;
	dialog.cutscene = id;
    with dialog event_user(events.format_text);
}