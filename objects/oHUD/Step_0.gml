/// @desc handle the state engine

//search for button functions
if state = 0 { //default state where buttons work
	if instance_exists(buttons[0]) and buttons[0].click = true	{
		//open up a test menu
		pause_music();
		var newMenu = instance_create_depth(400, 160, depth-2, oOptions);
	}
} else if state = 1 { //waiting on options menu to close, then return to default state
	if !instance_exists(oOptions){
		state = 0;
		resume_music();
	}
}