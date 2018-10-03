///@description provides player control functionality to the battle object

//start by getting some basic values
var user = combatants[active_combatant];
var act = combatants[active_combatant].active_pokemon; var team = combatants[active_combatant].pokemon;

//if we've already been defeated, pass our turn and exit this script
if act == noone	{
	active_combatant++;
	exit;
}

if act.hp_cur <= 0	{ //run defeat checker codes
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
	
	//next, check to see if team menu has sent us a new pokemon
	if last_action_data != noone {
		set_pokemon_player(last_action_data);
		act = combatants[active_combatant].active_pokemon;
		last_action_data = noone;
		last_action = noone;
		if instance_exists(oBattleMove) with oBattleMove state++;
		exit;
	}
	
	//if we have another pokemon that can replace this one, send us to the team menu to select it
	var len = array_length_1d(team), arr = [];
	for (var i = 0; i < len; i++) {
		if instance_exists(team[i]) and team[i].hp_cur > 0 {
			arr[array_length_1d(arr)] = team[i];
		}
	}
	if array_length_1d(arr) > 0 {
		//if team menu isn't open, open it
		if !instance_exists(oTeamMenu)	instance_create_depth(x, y, depth-3, oTeamMenu);
		
		if instance_exists(oBattleMenu) with oBattleMenu { //this shouldn't trigger, but just in case...
			state = 2;
			for (var i=0; i<array_length_1d(buttons); i++) {
				if instance_exists(buttons[i])		with buttons[i]	{
					instance_destroy();
				}
			}
		}
	} else { //if we have no pokemon to switch in, check for defeat, or pass us by
		
		var enemy_hp = 0; var player_hp = 0;
		for (var i = 0; i < combatant_count; i++) {
			var act = combatants[i].active_pokemon;
			if instance_exists(act)	player_hp += act.hp_cur;
		} for (var i = combatant_count; i < array_length_1d(combatants); i++) {
			var act = combatants[i].active_pokemon;
			if instance_exists(act)	enemy_hp += act.hp_cur;
		}
	
		if player_hp <= 0 or enemy_hp <= 0 { //trigger end battle phase
			//show_message("End Battle triggered")
			turn_phase = 9;
			exit;
		} else {
			combatants[active_combatant].active_pokemon = noone;
			active_combatant++;
		}
		
		//if instance_exists(oBattleMove) with oBattleMove state++;
	} 
} else { //our pokemon is not defeated, run regular command codes
	if !instance_exists(menu)	{
		menu = instance_create_depth(x, y, depth-1, oBattleMenu)
		menu.par = combatants[other.active_combatant];
	} else { //if menu already exists, we wait for input objects to set last_action
		battle_text_message("player");
		if last_action = battle_actions.use_move {
			var prio = ds_grid_get(global.moves, move_stats.priority, last_action_data);
			var mult = get_stat_modifier(round(act.spd_lvl) );
			prio = (prio*1000) + (act.spd_cur * mult);
			//randomize current target; temporary fix for lacking a targeting state
			var targ = irandom_range(combatant_count, array_length_1d(combatants)-1 );
			while targ == noone targ = irandom_range(combatant_count, array_length_1d(combatants)-1 );
			//note to self, this loop will circle infinitely if the targeting system runs with no opponents
			
			ds_grid_set(actions_list, 0, active_combatant, active_combatant); //register user
			ds_grid_set(actions_list, 1, active_combatant, battle_actions.use_move); //tell game to make move
			ds_grid_set(actions_list, 2, active_combatant, last_action_data); //register move id
			ds_grid_set(actions_list, 3, active_combatant, targ); //register target
			//ds_grid_set(actions_list, 3, turn_state, last_action_target);
			ds_grid_set(actions_list, 4, active_combatant, prio);
			last_action = noone; last_action_data = noone; last_action_target = noone;
			if instance_exists(menu) with menu instance_destroy();
			active_combatant++;
			battle_text_message("");
			//show_message("Player chose a move.")
		} else if last_action = battle_actions.change_pokemon {
			var prio = 6000;
			ds_grid_set(actions_list, 0, active_combatant, active_combatant);
			ds_grid_set(actions_list, 1, active_combatant, battle_actions.change_pokemon);
			ds_grid_set(actions_list, 2, active_combatant, last_action_data); //in this case, stores new pokemon id
			ds_grid_set(actions_list, 3, active_combatant, noone);
			//ds_grid_set(actions_list, 3, turn_state, last_action_target);
			ds_grid_set(actions_list, 4, active_combatant, prio);
			last_action = noone; last_action_data = noone; last_action_target = noone;
			if instance_exists(menu) with menu instance_destroy();
			active_combatant++;
			battle_text_message("");
			//show_message("Player chose to change pokemon.")
		} else if last_action = battle_actions.use_item {
			var mult = get_stat_modifier(round(act.spd_lvl) );
			var prio = user.spd_cur * mult;
			ds_grid_set(actions_list, 0, active_combatant, active_combatant);
			ds_grid_set(actions_list, 1, active_combatant, battle_actions.use_item);
			ds_grid_set(actions_list, 2, active_combatant, last_action_data); //in this case, stores item id
			ds_grid_set(actions_list, 3, active_combatant, self);
			//ds_grid_set(actions_list, 3, turn_state, last_action_target);
			ds_grid_set(actions_list, 4, active_combatant, prio);
			last_action = noone; last_action_data = noone; last_action_target = noone;
			if instance_exists(menu) with menu instance_destroy();
			active_combatant++;
			battle_text_message("");
		} else if last_action == battle_actions.just_wait {
			last_action = noone; last_action_data = noone; last_action_target = noone;
			if instance_exists(menu) with menu instance_destroy();
			active_combatant++;
			battle_text_message("");
		}
	}
}