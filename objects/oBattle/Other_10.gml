/// @description battle intro animation
if animation_state == 0 {
	if visible == true {
		text_box = instance_create_depth(xx, yy+376, depth-2, oBattleText);
		battle_text_message("");
		
		//iterate through all combatants to set their depth and initial appearance
		for (var i = 0; i < array_length_1d(combatants); i++) {
			if combatants[i].trainer_pic != noone {
				combatants[i].sprite_index = combatants[i].trainer_pic;
			} else {
				var t = combatants[i].active_pokemon;
				combatants[i].sprite_index = ds_grid_get(global.breedData, stats_breed.picture, t.breed_ref);
			}
			
			//modify combatant depth to appear above battle object
			combatants[i].depth = depth-1;
		} //end of for loop
		
		if combatant_count == 1 {//it's a mono-battle
			//start by setting the position of the objects
			combatants[0].x = player_x[0]-1000; 
			combatants[0].y = player_y; 
			combatants[0].pose = battle_poses.back;
			combatants[1].x = enemy_x[0]-1000; 
			combatants[1].y = enemy_y; 
			combatants[1].pose = battle_poses.front;
		} else if combatant_count == 2 { //for a double battle
			//start by setting the position of the objects to make them appear
			combatants[0].x = player_x[0]-1000; 
			combatants[0].y = player_y; 
			combatants[0].pose = battle_poses.back;
			combatants[1].x = player_x[2]-1000; 
			combatants[1].y = player_y; 
			combatants[1].pose = battle_poses.back;
			combatants[2].x = enemy_x[0]-1000; 
			combatants[2].y = enemy_y; 
			combatants[2].pose = battle_poses.front;
			combatants[3].x = enemy_x[2]-1000; 
			combatants[3].y = enemy_y; 
			combatants[3].pose = battle_poses.front;
		} else if combatant_count == 3 { //and now for triple battle
			//start by setting the position of the objects to make them appear
			combatants[0].x = player_x[0]-1000; 
			combatants[0].y = player_y; 
			combatants[0].pose = battle_poses.back;
			combatants[1].x = player_x[1]-1000; 
			combatants[1].y = player_y; 
			combatants[1].pose = battle_poses.back;
			combatants[2].x = player_x[2]-1000; 
			combatants[2].y = player_y; 
			combatants[2].pose = battle_poses.back;
			combatants[3].x = enemy_x[0]-1000; 
			combatants[3].y = enemy_y; 
			combatants[3].pose = battle_poses.front;
			combatants[4].x = enemy_x[1]-1000; 
			combatants[4].y = enemy_y; 
			combatants[4].pose = battle_poses.front;
			combatants[5].x = enemy_x[2]-1000; 
			combatants[5].y = enemy_y; 
			combatants[5].pose = battle_poses.front;
		}
		
		with oBattleCombatant image_index = pose;
		animation_state++;
	}
} else if animation_state == 1 {
	if combatants[0].x < player_x[0] {
		for ( i = 0; i < array_length_1d(combatants); i++) {
			combatants[i].x += 5;
		}
	} else {
		var n = ""; var t = true;
		if combatant_count == 1 {//it's a mono-battle
			//start by setting the position of the objects to make them appear
			combatants[0].x = player_x[0];
			combatants[1].x = enemy_x[0];
			
			//and then collect the enemy's name for the text function
			n = get_combatants_name(combatants[1]);
		} else if combatant_count == 2 { //for a double battle
			//start by setting the position of the objects to make them appear
			combatants[0].x = player_x[0]; combatants[1].x = player_x[2];
			combatants[2].x = enemy_x[0]; combatants[3].x = enemy_x[2];
					
			//and then collect the enemy's names for the text function
			n = get_combatants_name(combatants[2], combatants[3]);
		} else if combatant_count == 3 { //and now for triple battle
			//start by setting the position of the objects to make them appear
			combatants[0].x = player_x[0]; combatants[1].x = player_x[1]; combatants[2].x = player_x[2];
			combatants[3].x = enemy_x[0]; combatants[4].x = enemy_x[1]; combatants[5].x = enemy_x[2];
			
			//and then collect the enemy's names for the text function
			n = get_combatants_name(combatants[3], combatants[4], combatants[5]);
		}
		
		//here, we use the names collected in the size-specific ifs to display start text and move on
		battle_text_message(random_battle_start_text(n, t));
		
		text_timer = 3*GAME_SPEED;
		animation_state++;
	}
} else if animation_state == 2 { //here, wait a bit then display enemy choose text so we can move again
	if text_box.text[0] == "" {
		text_timer = 0;
	}
	if text_timer > 0	{
		text_timer--;
	} else if sprite_exists(combatants[combatant_count].trainer_pic) { //text timer has timed down or text is now blank, display enemy choose text
		var n = "";
		if combatant_count == 3 {
			var n1 = combatants[3].active_pokemon;
			var n2 = combatants[4].active_pokemon;
			var n3 = combatants[5].active_pokemon;
			var n = string(n1.nickname) + " and " + string(n2.nickname) + " and " + string(n3.nickname);
		} else if combatant_count == 2 {
			var n1 = combatants[2].active_pokemon;
			var n2 = combatants[3].active_pokemon;
			var n = string(n1.nickname) + " and " + string(n2.nickname);
		} else {
			var n1 = combatants[1].active_pokemon;
			var n = string(n1.nickname);
		}
		battle_text_message(random_battle_change_pokemon(n));
		text_timer = 1*GAME_SPEED;
		animation_state++;
	} else { //text timer has timed down, but we have no trainer, so skip ahead to the player choose text
		animation_state = 4;
		text_timer = 3 * GAME_SPEED;
	}
} else if animation_state == 3 { //move enemies off screen, then reposition them and set active pokemon
	if combatants[combatant_count].x < enemy_x[0]+400 { // if enemy is not at the end of its movement, move it
		for (var i = combatant_count; i < array_length_1d(combatants); i++) {
			combatants[i].x += 5;
		}
	} else { //enemy has reached the end of its movement; snap it back and change to morph art
		if combatant_count == 1 {//it's a mono-battle
			with combatants[combatant_count]	{
				sprite_index = ds_grid_get(global.breedData, stats_breed.picture, active_pokemon.breed_ref);
				image_index = pose;
				x = other.enemy_x[0];
			}
			
			//now generate the stats page for each combatant
			combatants[1].stats = instance_create_depth(stats_x[2], stats_y[0], depth-1, oBattleStats);
			with combatants[1].stats	parent = other.combatants[1];
		} else if combatant_count == 2 { //for a double battle
			//fix the position and sprite of each combatant
			with combatants[combatant_count]	{
				sprite_index = ds_grid_get(global.breedData, stats_breed.picture, active_pokemon.breed_ref);
				image_index = pose;
				x = other.enemy_x[0];
			} with combatants[combatant_count+1]	{
				sprite_index = ds_grid_get(global.breedData, stats_breed.picture, active_pokemon.breed_ref);
				image_index = pose;
				x = other.enemy_x[2];
			}
		} else if combatant_count == 3 { //and now for triple battle
			//fix the position and sprite of each combatant
			with combatants[combatant_count]	{
				sprite_index = ds_grid_get(global.breedData, stats_breed.picture, active_pokemon.breed_ref);
				image_index = pose;
				x = other.enemy_x[0];
			} with combatants[combatant_count+1]	{
				sprite_index = ds_grid_get(global.breedData, stats_breed.picture, active_pokemon.breed_ref);
				image_index = pose;
				x = other.enemy_x[1];
			} with combatants[combatant_count+2]	{
				sprite_index = ds_grid_get(global.breedData, stats_breed.picture, active_pokemon.breed_ref);
				image_index = pose;
				x = other.enemy_x[2];
			}
		
			//now generate the stats page for each combatant
			combatants[3].stats = instance_create_depth(stats_x[2], stats_y[0], depth-1, oBattleStats);
			combatants[4].stats = instance_create_depth(stats_x[1], stats_y[1], depth-1, oBattleStats);
			combatants[5].stats = instance_create_depth(stats_x[0], stats_y[2], depth-1, oBattleStats);
			with combatants[3].stats	parent = other.combatants[3];
			with combatants[4].stats	parent = other.combatants[4];
			with combatants[5].stats	parent = other.combatants[5];
		}
		//at the end of all of this, advance the state
		animation_state++;
		text_timer = 3*GAME_SPEED;
	}
} else if animation_state == 4 {
	if text_box.text[0] == "" {
		text_timer = 0;
	}
	if text_timer > 0	{
		text_timer--;
	}
	else { //text timer has timed down or text is now blank, display player choose text
		var n = "";
		if combatant_count == 3 {
			var n1 = combatants[0].active_pokemon;
			var n2 = combatants[1].active_pokemon;
			var n3 = combatants[2].active_pokemon;
			var n = string(n1.nickname) + " and " + string(n2.nickname) + " and " + string(n3.nickname);
		} else if combatant_count == 2 {
			var n1 = combatants[0].active_pokemon;
			var n2 = combatants[1].active_pokemon;
			var n = string(n1.nickname) + " and " + string(n2.nickname);
		} else {
			var n1 = combatants[0].active_pokemon;
			var n = string(n1.nickname);
		}
		battle_text_message(random_battle_change_pokemon(n));
		text_timer = 1*GAME_SPEED;
		animation_state++;
	}
} else if animation_state == 5 { //move player off screen, then reposition them and set active pokemon
	if combatants[0].x > player_x[0]-400 { // if player combatant is not at the end of its movement
		for (var i = 0; i < combatant_count; i++) {
			combatants[i].x -= 5;
		}
	} else { //player has reached the end of its movement, snap back and change to starting morph
		if combatant_count == 1 {//it's a mono-battle
			//fix the position and sprite of each combatant
			with combatants[0]	{
				sprite_index = ds_grid_get(global.breedData, stats_breed.picture, active_pokemon.breed_ref);
				image_index = pose;
				x = other.player_x[0];
			}
			
			//now generate the stats page for each combatant
			combatants[0].stats = instance_create_depth(stats_x[5], stats_y[5], depth-1, oBattleStats);
			with combatants[0].stats	parent = other.combatants[0];
		} else if combatant_count == 2 { //for a double battle
			//fix the position and sprite of each combatant
			with combatants[0]	{
				sprite_index = ds_grid_get(global.breedData, stats_breed.picture, active_pokemon.breed_ref);
				image_index = pose;
				x = other.player_x[0];
			} with combatants[1]	{
				sprite_index = ds_grid_get(global.breedData, stats_breed.picture, active_pokemon.breed_ref);
				image_index = pose;
				x = other.player_x[1];
			}
			
			//now generate the stats page for each combatant
			combatants[0].stats = instance_create_depth(stats_x[4], stats_y[5], depth-1, oBattleStats);
			combatants[1].stats = instance_create_depth(stats_x[5], stats_y[4], depth-1, oBattleStats);
			with combatants[0].stats	parent = other.combatants[0];
			with combatants[1].stats	parent = other.combatants[1];
		} else if combatant_count == 3 { //and now for triple battle
			//fix the position and sprite of each combatant
			with combatants[0]	{
				sprite_index = ds_grid_get(global.breedData, stats_breed.picture, active_pokemon.breed_ref);
				image_index = pose;
				x = other.player_x[0];
			} with combatants[1]	{
				sprite_index = ds_grid_get(global.breedData, stats_breed.picture, active_pokemon.breed_ref);
				image_index = pose;
				x = other.player_x[1];
			} with combatants[2]	{
				sprite_index = ds_grid_get(global.breedData, stats_breed.picture, active_pokemon.breed_ref);
				image_index = pose;
				x = other.player_x[2];
			}
			
			//now generate the stats page for each combatant
			combatants[0].stats = instance_create_depth(stats_x[3], stats_y[5], depth-1, oBattleStats);
			combatants[1].stats = instance_create_depth(stats_x[4], stats_y[4], depth-1, oBattleStats);
			combatants[2].stats = instance_create_depth(stats_x[5], stats_y[3], depth-1, oBattleStats);
			with combatants[0].stats	parent = other.combatants[0];
			with combatants[1].stats	parent = other.combatants[1];
			with combatants[2].stats	parent = other.combatants[2];
		}
		//at the end of all of this, advance the state
		animation_state++;
		text_timer = 2*GAME_SPEED;
	}
} else if animation_state == 6 {
	if text_box.text[0] == "" {
		text_timer = 0;
	}
	
	if text_timer > 0	text_timer--;
	else {
		animation_state = 0;
		battle_text_message("");
		turn_phase++;
	}
	
}