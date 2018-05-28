/// @desc manage button functions
if state == 0 {
	if instance_exists(buttons[0]) and buttons[0].click = true	{ //switch to move selection
		//for this, I see two options. 1, use an alternate state to manage the new buttons inside this menu
		//2, create a new menu object which initializes to the moves of the active player pokemon
		//for now, I think I'll go with 1
		state = 10;
		
		if active_morph.moves_1 == -1	buttons[0].text = "";
		else	buttons[0].text = ds_grid_get(global.moves, move_stats.name, active_morph.moves_1);
		
		if active_morph.moves_2 == -1	buttons[1].text = "";
		else	buttons[1].text = ds_grid_get(global.moves, move_stats.name, active_morph.moves_2);
		
		if active_morph.moves_3 == -1	buttons[2].text = "";
		else	buttons[2].text = ds_grid_get(global.moves, move_stats.name, active_morph.moves_3);
		
		if active_morph.moves_4 == -1	buttons[3].text = "";
		else	buttons[3].text = ds_grid_get(global.moves, move_stats.name, active_morph.moves_4);
		
	} else if instance_exists(buttons[1]) and buttons[1].click = true	{ //switch to pokemorph menu
		instance_create_depth(x, y, depth-1, oTeamMenu);
		state = 1;
		for (var i=0; i<array_length_1d(buttons); i++) {
			if instance_exists(buttons[i])		with buttons[i]	{
				instance_destroy();
			}
		}
	} else if instance_exists(buttons[2]) and buttons[2].click = true	{ //switch to items menu
		//temporarily, until we have a proper items menu, just use this button as a catch attempt
	} else if instance_exists(buttons[3]) and buttons[3].click = true	{ //attempt to flee combat
		if instance_exists(oBattle)	with oBattle	instance_destroy();
	}
} else if state == 1 {	//waiting for team menu to switch off
	if !instance_exists(oTeamMenu)	{
		state = 0;
		buttons[0] = instance_create_depth(x+18, y+18, depth-1, oBattleButton); buttons[0].text = "Attack";
		buttons[1] = instance_create_depth(x+170, y+18, depth-1, oBattleButton); buttons[1].text = "Morphs";
		buttons[2] = instance_create_depth(x+18, y+80, depth-1, oBattleButton); buttons[2].text = "Items";
		buttons[3] = instance_create_depth(x+170, y+80, depth-1, oBattleButton); buttons[3].text = "Flee";
	}
} else if state == 2 {	//waiting for items menu to switch off
	if !instance_exists(oTeamMenu)	{
		state = 0;
		buttons[0] = instance_create_depth(x+18, y+18, depth-1, oBattleButton); buttons[0].text = "Attack";
		buttons[1] = instance_create_depth(x+170, y+18, depth-1, oBattleButton); buttons[1].text = "Morphs";
		buttons[2] = instance_create_depth(x+18, y+80, depth-1, oBattleButton); buttons[2].text = "Items";
		buttons[3] = instance_create_depth(x+170, y+80, depth-1, oBattleButton); buttons[3].text = "Flee";
	}
} else if state == 10 {	//move selection menu state
	if instance_exists(buttons[0]) and buttons[0].text != "" and buttons[0].click = true	{ 
		//move 1 selected
		state = 0;
		buttons[0].text = "Attack";
		buttons[1].text = "Morphs";
		buttons[2].text = "Items";
		buttons[3].text = "Flee";
	} else if instance_exists(buttons[1]) and buttons[1].text != "" and buttons[1].click = true	{ 
		//move 2 selected
		state = 0;
		buttons[0].text = "Attack";
		buttons[1].text = "Morphs";
		buttons[2].text = "Items";
		buttons[3].text = "Flee";
	} else if instance_exists(buttons[2]) and buttons[2].text != "" and buttons[2].click = true	{ 
		//move 3 selected
		state = 0;
		buttons[0].text = "Attack";
		buttons[1].text = "Morphs";
		buttons[2].text = "Items";
		buttons[3].text = "Flee";
	} else if instance_exists(buttons[3]) and buttons[3].text != "" and buttons[3].click = true	{ 
		//move 4 selected
		state = 0;
		buttons[0].text = "Attack";
		buttons[1].text = "Morphs";
		buttons[2].text = "Items";
		buttons[3].text = "Flee";
	}
}