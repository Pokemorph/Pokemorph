/// @function set_pokemon_player();
/// @description Changes the active player pokemon in a battle
/// @arg pokemon_id

var pokemon_id = argument0; 

if instance_exists(oBattle)	with oBattle {
	pmon = pokemon_id;
	event_user(0);
	battle_text_message(random_battle_change_pokemon(pmon) );
}