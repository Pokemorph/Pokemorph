/// @desc control battle state engine
// You can write your code in this editor

if turn_phase == 0 { //introductory phase
	event_user(0);
} else if turn_phase == 1 { //command phase
	//run ai for each combatant in order
	if array_length_1d(combatants) > active_combatant {
		if instance_exists(combatants[active_combatant]) { //make sure instance exists before calling its ai
			if text_box.text[0] == "" or text_box.text[0] == "player" {
				active_morph = combatants[active_combatant].active_pokemon;
				script_execute(combatants[active_combatant].ai_script);
			}
		} else if text_box.text[0] == ""		active_combatant++;
	} else { //if anything goes wrong, or if we go past the array of combatants, update the turn phase
		turn_phase++;
	}
} else if turn_phase == 2 {	//pre-execution phase, for sorting actions and anything else that comes up
	ds_grid_sort(actions_list, 4, false);
	active_combatant = 0;
	turn_phase++;
} else if turn_phase == 3 {	//execution phase for performing all actions in the sorted order
	if ds_grid_height(actions_list) > active_combatant	{
		if text_box.text[0] == "" {
			var act = ds_grid_get(actions_list, 1, active_combatant);
			if act = battle_actions.use_move {
				if !instance_exists(oBattleMove) {
					var m = instance_create_depth(0, active_combatant, depth-1, oBattleMove);
					var temp = ds_grid_get(actions_list, 0, active_combatant)
					m.user = combatants[temp].active_pokemon;
					m.target_combatant_id = ds_grid_get(actions_list, 3, active_combatant);;
					m.move_id = ds_grid_get(actions_list, 2, active_combatant);
					m.target = combatants[m.target_combatant_id].active_pokemon;
					//show_message("Creating new move.")
				}
			} else if act = battle_actions.use_item {
				active_combatant++;
			} else if act = battle_actions.change_pokemon {
				combatants[active_combatant].active_pokemon = ds_grid_get(actions_list, 2, active_combatant);
				act = combatants[active_combatant].active_pokemon;
				combatants[active_combatant].sprite_index = ds_grid_get(global.breedData, stats_breed.picture, act.breed_ref);
				//event_user(0);
				var n = combatants[active_combatant].active_pokemon; n = n.nickname;
				battle_text_message(random_battle_change_pokemon(n));
				active_combatant++;
			} else { //if we hit the wait action, or any unregistered actions, advance the player
				active_combatant++;
			}
		}
	} else {
		ds_grid_clear(actions_list, noone);
		turn_count++;
		active_combatant = 0;
		turn_phase = 1;
	}
} else if turn_phase = 9 {
	event_user(1);
}