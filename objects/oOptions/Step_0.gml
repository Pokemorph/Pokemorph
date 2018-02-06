/// @desc Handle button functions

if instance_exists(buttons[0]) and buttons[0].click = true	{
	instance_destroy();		// destroy the menu, reverting to screen above
} else if instance_exists(buttons[1]) and buttons[1].active = true { //music slider
	var val = buttons[1].tracker / 100;
	if val != oGameControl.volume_music {
		oGameControl.volume_music = val;
		audio_group_set_gain(audiogroup_music, val, 0);
	}
} else if instance_exists(buttons[2]) and buttons[2].active = true { //sounds slider
	var val = buttons[2].tracker / 100;
	if val != oGameControl.volume_sound {
		oGameControl.volume_sound = val;
		audio_group_set_gain(audiogroup_default, val, 0);
	}
}