///message_box("text")

if !instance_exists(oDialog) {
	var dialog = instance_create_depth(x, y, 10, oDialog);
	dialog.text[0] = argument0;
	dialog.cutscene = instance_id;
	with dialog event_user(0);
}