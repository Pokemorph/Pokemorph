/// @desc handle the state engine
// connect the dots in the animation sequence


//search for button functions
if instance_exists(buttons[0]) and buttons[0].click = true	{
	room_goto(rm_pallet_town);	// new game
}