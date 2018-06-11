///basic battle AI; provides randomized NPC decisions to the battle object

//start off by checking for pokemon defeat
var user = combatants[active_combatant];
var act = combatants[active_combatant].active_pokemon; var team = combatants[active_combatant].pokemon;
//if instance_exists(active_combatant)	act = active_combatant.active_pokemon;
if act.hp_cur <= 0	{ //if enemy pokemon is defeated
	
	//gather surviving team array for selection	
	var len = array_length_1d(team), arr = [];
	for (var i = 0; i < len; i++) {
		if instance_exists(team[i]) and team[i].hp_cur > 0 {
			arr[array_length_1d(arr)] = team[i];
		}
	}
	
	if array_length_1d(arr) > 0 { //if we found an applicable pokemon to replace the defeated one
		//select random pokemon from list of available
		var r = irandom_range(0, array_length_1d(arr)-1);
		set_pokemon_enemy(arr[r]);
		
		//now to search for an action with our signature and remove it from the list
		for (var i = 0; i > ds_grid_height(actions_list); i++) {
			if ds_grid_get(actions_list, 0, i) == combatants[active_combatant] {
				ds_grid_set(actions_list, 0, i, noone);
				ds_grid_set(actions_list, 1, i, noone);
				ds_grid_set(actions_list, 2, i, noone);
				ds_grid_set(actions_list, 3, i, noone);
				ds_grid_set(actions_list, 4, i, noone);
				ds_grid_sort(actions_list, 4, false);
				break;
			}
		}
	} else { //defeat codes
		instance_destroy();
	}
} else	{	//if our pokemon is not dead, for now, just rollover to player turn
	active_combatant++;
}

/// 

/*
if !instance_exists(oBattleMenu)	{
	with instance_create_depth(x, y, depth-1, oBattleMenu) {
		active_morph = other.combatants[active_player];
	}
} else { //if menu already exists, we wait for input objects to set last_action
	if last_action = battle_actions.use_move {
		var user = combatants[active_player];
		var prio = ds_grid_get(global.moves, move_stats.priority, last_action_data);
		var mult = get_stat_modifier(round(user.spd_lvl) );
		prio = (prio*1000) + (user.spd_cur * mult);
		ds_grid_set(actions_list, 0, active_player, active_morph);
		ds_grid_set(actions_list, 1, active_player, battle_actions.use_move);
		ds_grid_set(actions_list, 2, active_player, last_action_data); //in this case, stores move id
		ds_grid_set(actions_list, 3, active_player, combatants[1]);
		//ds_grid_set(actions_list, 3, turn_state, last_action_target);
		ds_grid_set(actions_list, 4, active_player, prio);
		last_action = noone; last_action_data = noone; last_action_target = noone;
		active_player++;
	} else if last_action = battle_actions.change_pokemon {
		var user = self;
		var prio = 6000;
		ds_grid_set(actions_list, 1, active_player, battle_actions.change_pokemon);
		ds_grid_set(actions_list, 2, active_player, last_action_data); //in this case, stores move id
		ds_grid_set(actions_list, 3, active_player, combatants[1]);
		//ds_grid_set(actions_list, 3, turn_state, last_action_target);
		ds_grid_set(actions_list, 4, active_player, prio);
		last_action = noone; last_action_data = noone; last_action_target = noone;
		active_player++;
	} else if last_action = battle_actions.use_item {
		var user = combatants[active_player];
		var mult = get_stat_modifier(round(user.spd_lvl) );
		var prio = user.spd_cur * mult;
		ds_grid_set(actions_list, 0, active_player, active_morph);
		ds_grid_set(actions_list, 1, active_player, battle_actions.change_pokemon);
		ds_grid_set(actions_list, 2, active_player, last_action_data); //in this case, stores new pokemon id
		ds_grid_set(actions_list, 3, active_player, self);
		//ds_grid_set(actions_list, 3, turn_state, last_action_target);
		ds_grid_set(actions_list, 4, active_player, prio);
		last_action = noone; last_action_data = noone; last_action_target = noone;
		active_player++;
	} else if last_action == battle_actions.just_wait {
		last_action = noone; last_action_data = noone; last_action_target = noone;
		active_player++;
	}
}