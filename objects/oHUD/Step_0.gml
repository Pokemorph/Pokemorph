/// @desc handle the state engine

//search for button functions
if state = 0 { //default state where buttons work
	if instance_exists(buttons[0]) and buttons[0].click = true	{
		//open up pokedex menu
		
	}
	if instance_exists(buttons[1]) and buttons[1].click = true	{
		//open up team menu
		instance_create_depth(400, 160, depth-2, oTeamMenu);
		/*for (var i=0; i<array_length_1d(buttons); i++) {
			if instance_exists(buttons[i])		with buttons[i]	{
				instance_destroy();
			}
		}*/
		state = 2;
	}
	if instance_exists(buttons[2]) and buttons[2].click = true	{
		//open up items menu
		
	}
	if instance_exists(buttons[3]) and buttons[3].click = true	{
		//open up player menu
		
	}
	if instance_exists(buttons[4]) and buttons[4].click = true	{
		//open up save menu
		
	}
	if instance_exists(buttons[5]) and buttons[5].click = true	{
		//open up options menu
		instance_create_depth(400, 160, depth-2, oOptions);
		/*for (var i=0; i<array_length_1d(buttons); i++) {
			if instance_exists(buttons[i])		with buttons[i]	{
				instance_destroy();
			}
		}*/
		state = 6;
	}
	if instance_exists(buttons[6]) and buttons[6].click = true	{
		//quit game
		game_end();
	}
} else if state = 2 { //waiting on options menu to close, then return to default state
	if !instance_exists(oTeamMenu) {
		/*
		var i = 6;
		buttons[i] = instance_create_depth(x, y+24+(30*i), depth-1, parButton);
		buttons[i].sprite_index = spr_hud_quit;
		i = 5;
		buttons[i] = instance_create_depth(x, y+24+(30*i), depth-1, parButton);
		buttons[i].sprite_index = spr_hud_options;
		i = 4;
		buttons[i] = instance_create_depth(x, y+24+(30*i), depth-1, parButton);
		buttons[i].sprite_index = spr_hud_save;
		i = 3;
		buttons[i] = instance_create_depth(x, y+24+(30*i), depth-1, parButton);
		buttons[i].sprite_index = spr_hud_player;
		i = 2;
		buttons[i] = instance_create_depth(x, y+24+(30*i), depth-1, parButton);
		buttons[i].sprite_index = spr_hud_items;
		i = 1;
		buttons[i] = instance_create_depth(x, y+24+(30*i), depth-1, parButton);
		buttons[i].sprite_index = spr_hud_pokemorphs;
		i = 0;
		buttons[i] = instance_create_depth(x, y+24+(30*i), depth-1, parButton);
		buttons[i].sprite_index = spr_hud_pokedex;
		*/
		state = 0;
	}
} else if state = 6 {
	if !instance_exists(oOptions) {
		state = 0;
	}
}