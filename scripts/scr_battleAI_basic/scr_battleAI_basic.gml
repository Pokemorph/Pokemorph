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
		for (var i = 0; i < ds_grid_height(actions_list); i++) {
			if ds_grid_get(actions_list, 0, i) == active_combatant {
				ds_grid_set(actions_list, 0, i, noone);
				ds_grid_set(actions_list, 1, i, noone);
				ds_grid_set(actions_list, 2, i, noone);
				ds_grid_set(actions_list, 3, i, noone);
				ds_grid_set(actions_list, 4, i, noone);
				break;
			}
		}
	} else { //if we have no pokemon to switch in, simply pass us by
		combatants[active_combatant].active_pokemon = noone;
		active_combatant++;
	}
} else	{	//if our pokemon is not dead, let's choose our action
	var arr = [];
	if act.moves_4 > -1 arr[3] = act.moves_4;
	if act.moves_3 > -1 arr[2] = act.moves_3;
	if act.moves_2 > -1 arr[1] = act.moves_2;
	if act.moves_1 > -1 arr[0] = act.moves_1;
	var r = irandom_range(0, array_length_1d(arr)-1);
	var prio = ds_grid_get(global.moves, move_stats.priority, arr[r]);
	var mult = get_stat_modifier(round(act.spd_lvl) );
	prio = (prio*1000) + (act.spd_cur * mult);
	
	//now that we have our attack selected, let's set the action list entry data
	ds_grid_set(actions_list, 0, active_combatant, active_combatant);
	ds_grid_set(actions_list, 1, active_combatant, battle_actions.use_move);
	ds_grid_set(actions_list, 2, active_combatant, arr[r]);
	ds_grid_set(actions_list, 3, active_combatant, 0);
	ds_grid_set(actions_list, 4, active_combatant, prio);
	active_combatant++;
	
	//show_message("AI chose an attack.")
}
