///@function scr_battle()
///@description starts a customizable battle with the player
///@argument background_id
///@argument "music"
///@argument can_flee
///@argument can_catch
///@argument team_0
///@argument ...


with instance_create_depth(0, 0, -15, oBattle) {
	image_index = argument[0];
	set_music(argument[1]);
	flee = argument[2];
	capture = argument[3];
	
	if argument_count == 5 {
		combatants[0] = new_team(oPlayer.trainer_pic, oPlayer.trainer_name, oPlayer.ai_script, oPlayer.pokemon[0], oPlayer.pokemon[1], oPlayer.pokemon[2], oPlayer.pokemon[3], oPlayer.pokemon[4], oPlayer.pokemon[5]);
		combatants[1] = argument[4];
		combatants[0].depth = depth-1; combatants[1].depth = depth-1;
	} else	for ( var i = 0; i <= argument_count-4; i++ ) {
		combatants[i] = argument[i+4];
		combatants[i].depth = depth-1;
	}
	combatant_count = round(array_length_2d(combatants, 0)/2 );
	
	//set combatant positions and collect their names for the text
	var n = ""; var t = true;
	if combatant_count == 1 {//determine positions of combatants 
		combatants[0].x = player_x[0]; combatants[0].y = player_y; combatants[0].pose = battle_poses.back;
		combatants[1].x = enemy_x[0]; combatants[1].y = enemy_y; combatants[1].pose = battle_poses.front;
		n = combatants[1].trainer_name;
		if n = "default" or n == "Bubbalicious" or n == "" { //no trainer here
			n = combatants[1].active_pokemon; n = n.nickname;
			t = false;
		} else { //if a trainer name is found
			t = true;
		}
	} else if combatant_count == 2 {
		combatants[0].x = player_x[0]; combatants[0].y = player_y; combatants[0].pose = battle_poses.back;
		combatants[1].x = player_x[2]; combatants[1].y = player_y; combatants[1].pose = battle_poses.back;
		combatants[2].x = enemy_x[0]; combatants[2].y = enemy_y; combatants[2].pose = battle_poses.front;
		combatants[3].x = enemy_x[2]; combatants[3].y = enemy_y; combatants[3].pose = battle_poses.front;
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
	} else if combatant_count == 3 {
		combatants[0].x = player_x[0]; combatants[0].y = player_y; combatants[0].pose = battle_poses.back;
		combatants[1].x = player_x[1]; combatants[1].y = player_y; combatants[1].pose = battle_poses.back;
		combatants[2].x = player_x[2]; combatants[2].y = player_y; combatants[2].pose = battle_poses.back;
		combatants[3].x = enemy_x[0]; combatants[3].y = enemy_y; combatants[3].pose = battle_poses.front;
		combatants[4].x = enemy_x[1]; combatants[4].y = enemy_y; combatants[4].pose = battle_poses.front;
		combatants[5].x = enemy_x[2]; combatants[5].y = enemy_y; combatants[5].pose = battle_poses.front;
		
		var n1 = combatants[3].trainer_name; var n2 = combatants[4].trainer_name; var n3 = combatants[5].trainer_name;
		if n1 = "default" or n1 == "Bubbalicious" or n1 == "" { //no trainer here
			n1 = combatants[3].active_pokemon; n1 = n1.nickname;
			if n2 = "default" or n2 == "Bubbalicious" or n2 == "" { //no trainer here either
				n2 = combatants[4].active_pokemon; n2 = n2.nickname;
				if n3 = "default" or n3 == "Bubbalicious" or n3 == "" { //no trainer here either
					n3 = combatants[5].active_pokemon; n3 = n3.nickname;
					t = false;
				}
			}
		} else { //if a trainer name is found
			t = true;
		} n = n1 + " and " + n2 + " and " + n3;
	}
	
	event_user(0);
	battle_text_message(random_battle_start_text(n, t));
}