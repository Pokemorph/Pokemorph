/// @function set_pokemon_player();
/// @description Changes the active player pokemon in a battle
/// @arg pokemon_id

var pokemon_id = argument0; 

if instance_exists(oBattle)	with oBattle {
	emon = pokemon_id;
	event_user(0);
	if instance_exists(oBattleText)	with oBattleText {
		text[0] = "Enemy etrain has called emon!";
		event_user(events.format_text);
	}
}