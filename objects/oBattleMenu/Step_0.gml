/// @desc manage button functions
if instance_exists(buttons[0]) and buttons[0].click = true	{ //switch to move selection
	
} else if instance_exists(buttons[1]) and buttons[1].click = true	{ //switch to pokemorph menu
	
} else if instance_exists(buttons[2]) and buttons[2].click = true	{ //switch to items menu
	
} else if instance_exists(buttons[3]) and buttons[3].click = true	{ //attempt to flee combat
	if instance_exists(oBattle)	with oBattle	instance_destroy();
}