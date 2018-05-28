///@function battle_text_message()
///@description Passes text to the battle text box
///@argument text
///@argument ...

if instance_exists(oBattleText)	{
	with oBattleText	text = 0; text = []; text[0] = "";
	for (var i = 0; i < argument_count; i++) {
		oBattleText.text[i] = argument[i];
	}
	with oBattleText	event_user(events.format_text);
}