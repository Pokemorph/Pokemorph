/// @desc handle the state engine

//search for button functions
if state = 0 { //default state where buttons work
	if instance_exists(buttons[0]) and buttons[0].click = true	{
		//open up a test menu
		var newMenu = instance_create_depth(400, 160, depth-2, oOptions);
		for (var i=0; i<array_length_1d(buttons); i++) {
			if instance_exists(buttons[i])		with buttons[i]	{
				instance_destroy();
			}
		}
		state = 1;
	}
} else if state = 1 { //waiting on options menu to close, then return to default state
	if !instance_exists(oOptions){
		buttons[0] = instance_create_depth(x, y+24, depth-1, ohud_options);
		state = 0;
	}
}