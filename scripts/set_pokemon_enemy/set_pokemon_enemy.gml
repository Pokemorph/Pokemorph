/// @function set_pokemon_player();
/// @description Changes the active player pokemon in a battle
/// @arg pokemon_id

if instance_exists(oBattle)	with oBattle {
	var p = argument0;
	combatants[active_combatant].active_pokemon = p;
	combatants[active_combatant].sprite_index = ds_grid_get(global.breedData, stats_breed.picture, p.breed_ref);
	//event_user(0);
	var t = combatants[active_combatant].trainer_name;
	var n = p.nickname;
	if instance_exists(oBattleText)	with oBattleText {
		text[0] = t + " has called " + n + "!";
		event_user(events.format_text);
	}
}