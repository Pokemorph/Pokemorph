/// @desc generate menu
// Initialize and position all menu components

// Inherit the parent event
event_inherited();

//create the buttons for each pokemorph
buttons[5] = instance_create_depth(x+566, y+346, depth-1, oTeamMorph);
buttons[4] = instance_create_depth(x+566, y+280, depth-1, oTeamMorph);
buttons[3] = instance_create_depth(x+566, y+214, depth-1, oTeamMorph);
buttons[2] = instance_create_depth(x+566, y+148, depth-1, oTeamMorph);
buttons[1] = instance_create_depth(x+566, y+82, depth-1, oTeamMorph);
buttons[0] = instance_create_depth(x+566, y+16, depth-1, oTeamMorph);

//assign those buttons to their team members
buttons[0].morph = oPlayer.pokemon1;
buttons[1].morph = oPlayer.pokemon2;
buttons[2].morph = oPlayer.pokemon3;
buttons[3].morph = oPlayer.pokemon4;
buttons[4].morph = oPlayer.pokemon5;
buttons[5].morph = oPlayer.pokemon6;

//create a second array with the stat page controls
page_controls[2] = instance_create_depth(x+212, y+34, depth-1, parButton);
page_controls[1] = instance_create_depth(x+122, y+34, depth-1, parButton);
page_controls[0] = instance_create_depth(x+32, y+34, depth-1, parButton);
page_controls[2].sprite_index = team_history;
page_controls[1].sprite_index = team_moves;
page_controls[0].sprite_index = team_stats;
stats_page = instance_create_depth(x+32, y+32, depth-2, oTeamStats);

button_return = instance_create_depth(x+384, y+416, depth-1, parButton);
button_return.sprite_index = team_return;
button_choose = instance_create_depth(x+608, y+416, depth-1, parButton);
button_choose.sprite_index = team_choose;
slider = instance_create_depth(x+332, y+358, depth-1, oTeamSlider);
slider_right = instance_create_depth(x+550, y+364, depth-2, parButton);
slider_left = instance_create_depth(x+334, y+364, depth-2, parButton);
slider_right.sprite_index = team_slider_arrow; slider_right.image_xscale = -1;
slider_left.sprite_index = team_slider_arrow;
slider_position = 0;
checkbox = instance_create_depth(x+338, y+376, depth-1, oTeamCheckbox);

pokeball = 0;
selected_button = buttons[0]; selected_button.selected = true;
active_morph = selected_button.morph;

