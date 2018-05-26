/// @desc manage button functions
if state == 0 {
	if instance_exists(buttons[0]) and buttons[0].click = true	{ //switch to move selection
	
	} else if instance_exists(buttons[1]) and buttons[1].click = true	{ //switch to pokemorph menu
		instance_create_depth(x, y, depth-1, oTeamMenu);
		state = 1;
		for (var i=0; i<array_length_1d(buttons); i++) {
			if instance_exists(buttons[i])		with buttons[i]	{
				instance_destroy();
			}
		}
	} else if instance_exists(buttons[2]) and buttons[2].click = true	{ //switch to items menu
	
	} else if instance_exists(buttons[3]) and buttons[3].click = true	{ //attempt to flee combat
		if instance_exists(oBattle)	with oBattle	instance_destroy();
	}
} else if state == 1 {
	if !instance_exists(oTeamMenu)	{
		state = 0;
		buttons[0] = instance_create_depth(x+18, y+18, depth-1, parButton); 
		buttons[0].sprite_index = battle_button_attack;
		buttons[1] = instance_create_depth(x+170, y+18, depth-1, parButton); 
		buttons[1].sprite_index = battle_button_morphs;
		buttons[2] = instance_create_depth(x+18, y+80, depth-1, parButton); 
		buttons[2].sprite_index = battle_button_items;
		buttons[3] = instance_create_depth(x+170, y+80, depth-1, parButton); 
		buttons[3].sprite_index = battle_button_flee;
	}
}