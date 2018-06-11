/// @desc control state variables and the battle
// You can write your code in this editor

if turn_phase == 0 { //introductory phase
	//for now, just initialize battle data and switch to pokemon sprites then move on
	//later on, this is where we'll try to animate the switch
	for (var i = 0; i < array_length_1d(combatants); i++) {
		var t = combatants[i].active_pokemon; t = t.breed_ref
		combatants[i].sprite_index = ds_grid_get(global.breedData, stats_breed.picture, t);
		//modify combatant depth to appear above battle object
		combatants[i].depth = depth-1;
	}
	
	//set combatant and stats positions and collect their names for the opening text
	//create stats objects in the same blocks
	var n = ""; var t = true;
	if combatant_count == 1 {//it's a mono-battle
		//start by setting the position of the objects to make them appear
		combatants[0].x = player_x[0]; combatants[0].y = player_y; combatants[0].pose = battle_poses.back;
		combatants[1].x = enemy_x[0]; combatants[1].y = enemy_y; combatants[1].pose = battle_poses.front;
		with oBattleCombatant image_index = pose;
		
		//now generate the stats page for each combatant
		combatants[0].stats = instance_create_depth(stats_x[5], stats_y[5], depth-2, oBattleStats);
		combatants[1].stats = instance_create_depth(stats_x[2], stats_y[0], depth-2, oBattleStats);
		with combatants[0].stats	parent = other.combatants[0];
		with combatants[1].stats	parent = other.combatants[1];
		
		//and finally, collect the enemy's name for the text function
		n = combatants[1].trainer_name;
		if n = "default" or n == "Bubbalicious" or n == "" { //no trainer here
			n = combatants[1].active_pokemon; n = n.nickname;
			t = false;
		} else { //if a trainer name is found
			t = true;
		}
	} else if combatant_count == 2 { //for a double battle
		//start by setting the position of the objects to make them appear
		combatants[0].x = player_x[0]; combatants[0].y = player_y; combatants[0].pose = battle_poses.back;
		combatants[1].x = player_x[2]; combatants[1].y = player_y; combatants[1].pose = battle_poses.back;
		combatants[2].x = enemy_x[0]; combatants[2].y = enemy_y; combatants[2].pose = battle_poses.front;
		combatants[3].x = enemy_x[2]; combatants[3].y = enemy_y; combatants[3].pose = battle_poses.front;
		with oBattleCombatant image_index = pose;
		
		//now generate the stats page for each combatant
		combatants[0].stats = instance_create_depth(stats_x[4], stats_y[5], depth-2, oBattleStats);
		combatants[1].stats = instance_create_depth(stats_x[5], stats_y[4], depth-2, oBattleStats);
		combatants[2].stats = instance_create_depth(stats_x[2], stats_y[0], depth-2, oBattleStats);
		combatants[3].stats = instance_create_depth(stats_x[0], stats_y[1], depth-2, oBattleStats);
		with combatants[0].stats	parent = other.combatants[0];
		with combatants[1].stats	parent = other.combatants[1];
		with combatants[2].stats	parent = other.combatants[2];
		with combatants[3].stats	parent = other.combatants[3];
		
		//and finally, collect the enemy's names for the text function
		var n1 = combatants[2].trainer_name; var n2 = combatants[3].trainer_name;
		if n1 = "default" or n1 == "Bubbalicious" or n1 == "" { //no trainer here
			n1 = combatants[2].active_pokemon; n1 = n1.nickname;
			if n2 = "default" or n2 == "Bubbalicious" or n2 == "" { //no trainer here either
				n2 = combatants[3].active_pokemon; n2 = n2.nickname;
				t = false;
			}
		} else { //if a trainer name is found
			t = true;
		} n = n1 + " and " + n2;
	} else if combatant_count == 3 { //and now for triple battle
		//start by setting the position of the objects to make them appear
		combatants[0].x = player_x[0]; combatants[0].y = player_y; combatants[0].pose = battle_poses.back;
		combatants[1].x = player_x[1]; combatants[1].y = player_y; combatants[1].pose = battle_poses.back;
		combatants[2].x = player_x[2]; combatants[2].y = player_y; combatants[2].pose = battle_poses.back;
		combatants[3].x = enemy_x[0]; combatants[3].y = enemy_y; combatants[3].pose = battle_poses.front;
		combatants[4].x = enemy_x[1]; combatants[4].y = enemy_y; combatants[4].pose = battle_poses.front;
		combatants[5].x = enemy_x[2]; combatants[5].y = enemy_y; combatants[5].pose = battle_poses.front;
		with oBattleCombatant image_index = pose;
		
		//now generate the stats page for each combatant
		combatants[0].stats = instance_create_depth(stats_x[3], stats_y[5], depth-2, oBattleStats);
		combatants[1].stats = instance_create_depth(stats_x[4], stats_y[4], depth-2, oBattleStats);
		combatants[2].stats = instance_create_depth(stats_x[5], stats_y[3], depth-2, oBattleStats);
		combatants[3].stats = instance_create_depth(stats_x[2], stats_y[0], depth-2, oBattleStats);
		combatants[4].stats = instance_create_depth(stats_x[1], stats_y[1], depth-2, oBattleStats);
		combatants[5].stats = instance_create_depth(stats_x[0], stats_y[2], depth-2, oBattleStats);
		with combatants[0].stats	parent = other.combatants[0];
		with combatants[1].stats	parent = other.combatants[1];
		with combatants[2].stats	parent = other.combatants[2];
		with combatants[3].stats	parent = other.combatants[3];
		with combatants[4].stats	parent = other.combatants[4];
		with combatants[5].stats	parent = other.combatants[5];
		
		//and finally, collect the enemy's names for the text function
		var n1 = combatants[3].trainer_name;
		var n2 = combatants[4].trainer_name;
		var n3 = combatants[5].trainer_name;
		if n1 = "default" or n1 == "Bubbalicious" or n1 == "" { //no trainer here
			n1 = combatants[3].active_pokemon; n1 = n1.nickname;
			if n2 = "default" or n2 == "Bubbalicious" or n2 == "" { //no trainer here either
				n2 = combatants[4].active_pokemon; n3 = n3.nickname;
				if n3 = "default" or n2 == "Bubbalicious" or n2 == "" { //no trainer here either
					n3 = combatants[5].active_pokemon; n3 = n3.nickname;
					t = false;
				}
			}
		} else { //if a trainer name is found
			t = true;
		} n = n1 + " and " + n2 + " and " + n3;
	}
	//event_user(0);
	battle_text_message(random_battle_start_text(n, t));
	/*
		End initialization phase. Commence command phase
	*/
	turn_phase++;
	
} else if turn_phase == 1 { //command phase
	if array_length_1d(combatants) > active_combatant {
		if instance_exists(combatants[active_combatant]) {
			active_morph = combatants[active_combatant].active_pokemon;
			script_execute(combatants[active_combatant].ai_script);
		} else active_combatant++;
	} else { //if anything goes wrong, or if we go past the array of combatants, update the turn phase
		turn_phase++;
	}
} else if turn_phase == 2 {	//pre-execution phase, for sorting actions and anything else that comes up
	ds_grid_sort(actions_list, 4, false);
	active_combatant = 0;
	turn_phase++;
} else if turn_phase == 3 {	//execution phase for performing all actions in the sorted order
	if ds_grid_height(actions_list) > active_combatant	{
		var act = ds_grid_get(actions_list, 1, active_combatant);
		if act = battle_actions.use_move and !instance_exists(oBattleMove) {
			var m = instance_create_depth(0, active_combatant, depth-1, oBattleMove);
			m.user = combatants[ds_grid_get(actions_list, 0, active_combatant)].active_pokemon;
			m.target_combatant_id = ds_grid_get(actions_list, 3, active_combatant);;
			m.move_id = ds_grid_get(actions_list, 2, active_combatant);
			m.target = combatants[m.target_combatant_id].active_pokemon;
			active_combatant++;
		} else if act = battle_actions.use_item {
			active_combatant++;
		} else if act = battle_actions.change_pokemon {
			combatants[active_combatant].active_pokemon = ds_grid_get(actions_list, 2, active_combatant);
			act = combatants[active_combatant].active_pokemon;
			combatants[active_combatant].sprite_index = ds_grid_get(global.breedData, stats_breed.picture, act.breed_ref);
			//event_user(0);
			battle_text_message(random_battle_change_pokemon(combatants[active_combatant].active_pokemon));
			active_combatant++;
		} else { //if we hit the wait action, or any unregistered actions, advance the player
			active_combatant++;
		}
	} else {
		ds_grid_clear(actions_list, noone);
		turn_phase = 1;
		active_combatant = 0;
	}
}