/// @desc handle the state engine
// connect the dots in the animation sequence


if state == 0 {//lower opacity, and set up the menu buttons
    if image_alpha > 0.75 {
        image_alpha -= 0.01;
    } else {
        buttons[0] = instance_create_depth(1024, 336, -10, oButtonNew);
		buttons[1] = instance_create_depth(1024, 400, -10, oButtonTest);
		//buttons[1] = instance_create_depth(1024, 400, -10, oButtonTutorial);
		buttons[2] = instance_create_depth(1024, 464, -10, oButtonLoad);
		buttons[3] = instance_create_depth(1024, 528, -10, oButtonOptions);
		buttons[4] = instance_create_depth(1024, 592, -10, oButtonQuit);
        state++;
    }
} else if state == 1 {//search for button functions
	if buttons[0].click = true			room_goto(rm_pallet_town);	// new game
	else if buttons[1].click = true		room_goto(rm_test);			// test game
	//else if buttons[1].click = true	room_goto(rm_tutorial);		// play tutorial
	else if buttons[2].click = true		room_goto(rm_pallet_town);	// load game
	else if buttons[3].click = true		{
		var newMenu = instance_create_depth(x, y, depth, oOptions);
		newMenu.parent_menu = self.id;
		state = 2
	}
	else if buttons[4].click = true		game_end();					// quit game
	else if buttons[5].click = true		url_open( "https://www.patreon.com/DarkImpulses" );	//goto patreon page
} else if state == 2 {//in this state, wait for the options menu to be destroyed
	if !instance_exists(oOptions)		state = 1;
}