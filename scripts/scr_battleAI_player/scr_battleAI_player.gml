///player control script for battles (run during player turn from battle object)

if pmon.hp_cur <= 0	{ //run defeat checker codes
	var len = array_length_1d(player_team), arr = [];
	for (var i = 0; i < len; i++) {
		if instance_exists(player_team[i]) and player_team[i].hp_cur > 0 {
			arr[array_length_1d(arr)] = player_team[i];
		}
	}
			
	//if no pokemon was found to replace the defeated one, initiate battle ending
	if array_length_1d(arr) == 0	{
		with oBattle	instance_destroy();
	} else { //found a replacement, open the team menu and rollover turn
		instance_create_depth(x, y, depth-1, oTeamMenu);
		menu.state = 2;
		for (var i=0; i<array_length_1d(menu.buttons); i++) {
			if instance_exists(menu.buttons[i])		with menu.buttons[i]	{
				instance_destroy();
			}
		}
	}
			
} else	{	//if pokemon is not dead, grant player control
	if !instance_exists(oBattleMenu)	menu = instance_create_depth(x, y, depth, oBattleMenu);
	else {	//if menu already exists, wait for feedback
		if action != noone {
			if instance_exists(menu) with menu	instance_destroy();
			state++;
			
		}
	}
}



/*
battle_state = 1;
current_player = 0;
turn_count++;

switch battle_state {
	case 0: 	//setup mode, for the battle start
	
		battle_text_message(random_battle_start_text(), random_battle_change_pokemon(pmon));
		break;
	case 1:		//waiting for last text to finish
		if text_box.text[0] = "" {
			if current_player == 0 {	//player turn
				menu = instance_create_depth(xx, yy, depth, oBattleMenu);
				menu.state = 1;
				battle_state++;
			} else if current_player == 1 {	//ai turn
				script_execute(enemy_ai);
			}
		} break;
	case 2:		//default state, waiting for action
		if instance_exists(oBattleMove)		battle_state = 3;
		if instance_exists(oTeamMenu)		battle_state = 4;
		break;
	case 3:		//waiting for move state to finish
		if !instance_exists(oBattleMove)	{
			battle_state = 1;
			if current_player == 0	current_player = 1;
			else if current_player == 1	{ //it was the AI's turn, come back to the player
				current_player = 0; turn_count++;
			}
		} break;
	case 4:		//waiting for team menu to close
		if !instance_exists(oTeamMenu)		{
			battle_state = 1;
			if current_player == 0	current_player = 1;
			else if current_player == 1	{ //it was the AI's turn, come back to the player
				current_player = 0; turn_count++;
			}
		} break;
}