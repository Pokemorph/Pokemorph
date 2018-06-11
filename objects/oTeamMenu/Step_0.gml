/// @desc control menu state
// destroy menu
if instance_exists(button_return) and button_return.click = true	{
	instance_destroy();
}
if instance_exists(button_choose) and button_choose.click = true	{
	if instance_exists(oBattle) if active_morph.hp_cur > 0 {
		oBattle.last_action = battle_actions.change_pokemon;
		oBattle.last_action_data = active_morph;
		instance_destroy();
	} else			instance_destroy();
}

//change active pokemorphs
if instance_exists(buttons[0]) and buttons[0].morph != noone and buttons[0].click = true {
	pokeball = 0;
	selected_button.selected = false;
	selected_button = buttons[0];
	selected_button.selected = true;
	active_morph = selected_button.morph;
	stats_page.morph = selected_button.morph;
} else if instance_exists(buttons[1]) and buttons[1].morph != noone and buttons[1].click = true {
	pokeball = 0;
	selected_button.selected = false;
	selected_button = buttons[1];
	selected_button.selected = true;
	active_morph = selected_button.morph;
	stats_page.morph = selected_button.morph;
} else if instance_exists(buttons[2]) and buttons[2].morph != noone and buttons[2].click = true {
	pokeball = 0;
	selected_button.selected = false;
	selected_button = buttons[2];
	selected_button.selected = true;
	active_morph = selected_button.morph;
	stats_page.morph = selected_button.morph;
} else if instance_exists(buttons[3]) and buttons[3].morph != noone and buttons[3].click = true {
	pokeball = 0;
	selected_button.selected = false;
	selected_button = buttons[3];
	selected_button.selected = true;
	active_morph = selected_button.morph;
	stats_page.morph = selected_button.morph;
} else if instance_exists(buttons[4]) and buttons[4].morph != noone and buttons[4].click = true {
	pokeball = 0;
	selected_button.selected = false;
	selected_button = buttons[4];
	selected_button.selected = true;
	active_morph = selected_button.morph;
	stats_page.morph = selected_button.morph;
} else if instance_exists(buttons[5]) and buttons[5].morph != noone and buttons[5].click = true {
	pokeball = 0;
	selected_button.selected = false;
	selected_button = buttons[5];
	selected_button.selected = true;
	active_morph = selected_button.morph;
	stats_page.morph = selected_button.morph;
}

if instance_exists(page_controls[0]) and page_controls[0].click = true {
	stats_page.state = 0;
} else if instance_exists(page_controls[1]) and page_controls[1].click = true {
	stats_page.state = 1;
} else if instance_exists(page_controls[2]) and page_controls[2].click = true {
	stats_page.state = 2;
}

if instance_exists(checkbox) and checkbox.click = true {
	if checkbox.selected = true		checkbox.selected = false;
	else							checkbox.selected = true;
}