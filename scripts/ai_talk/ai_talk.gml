/// @function ai_talk()
/// @description Open dialog box

if !instance_exists(oDialog)     {
    ai_lookat(oPlayer);
    var dialog = instance_create_depth(x, y, 10, oDialog);
    dialog.text = text;
    with dialog event_user(events.format_text);
}