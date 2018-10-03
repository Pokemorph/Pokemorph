///basic battle AI; provides randomized NPC decisions to the battle object

//start off by getting some basic values
var user = combatants[active_combatant];
var act = combatants[active_combatant].active_pokemon; var team = combatants[active_combatant].pokemon;

//if we've already been defeated, pass our turn and exit this script
if act == noone	{
	active_combatant++;
	exit;
}

if act != noone and act.hp_cur <= 0	{ //run defeat codes
	//if we've been defeated, immediately remove our action from the action list
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
	} else { //if we have no pokemon to switch in, check for defeat and pass us by
		
		var enemy_hp = 0; var player_hp = 0;
		for (var i = 0; i < combatant_count; i++) {
			var act = combatants[i].active_pokemon;
			if instance_exists(act)	player_hp += act.hp_cur;
		} for (var i = combatant_count; i < array_length_1d(combatants); i++) {
			var act = combatants[i].active_pokemon;
			if instance_exists(act)	enemy_hp += act.hp_cur;
		}
	
		if player_hp <= 0 or enemy_hp <= 0 { //end battle function
			//trigger end battle with the final turn phase
			turn_phase = 9;
			exit;
		} else {
			combatants[active_combatant].active_pokemon = noone;
			active_combatant++;
		}
	}
	if instance_exists(oBattleMove) with oBattleMove state++;
} else if act != noone	{	//if our pokemon is not dead, let's choose our action
	var arr = [];
	if act.moves_4 > -1 arr[3] = act.moves_4;
	if act.moves_3 > -1 arr[2] = act.moves_3;
	if act.moves_2 > -1 arr[1] = act.moves_2;
	if act.moves_1 > -1 arr[0] = act.moves_1;
	var r = irandom_range(0, array_length_1d(arr)-1);
	var prio = ds_grid_get(global.moves, move_stats.priority, arr[r]);
	var mult = get_stat_modifier(round(act.spd_lvl) );
	prio = (prio*1000) + (act.spd_cur * mult);
	var targ = irandom_range(0, combatant_count-1); //choose a random player-side target
	
	while targ == noone	targ = irandom_range(0, combatant_count-1); //and don't trip up on defeated foe
	//note to self, this will lead to an infinite loop if the AI gets to run while no enemies are on the field
	//but since the AIs check for battle end in the moment of death, it should never come to this
	
	//now that we have our attack selected, let's set the action list entry data
	//first we'll set the user
	//then the action type
	//the action data, in this case the move id
	//then the target combatant
	//and finally the priority for sorting
	ds_grid_set(actions_list, 0, active_combatant, active_combatant);
	ds_grid_set(actions_list, 1, active_combatant, battle_actions.use_move);
	ds_grid_set(actions_list, 2, active_combatant, arr[r]);
	ds_grid_set(actions_list, 3, active_combatant, targ);
	ds_grid_set(actions_list, 4, active_combatant, prio);
	active_combatant++;
	
	//show_message("AI chose an attack.")
}
