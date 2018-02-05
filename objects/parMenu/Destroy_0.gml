/// @desc cleanup affixed menu
// for standard menus that merely use the buttons array, just loop through the array deleting everything

for (var i=0; i<array_length_1d(buttons); i++) {
	if instance_exists(buttons[i])		with buttons[i]	{
		instance_destroy();
	}
}
//search for a higher menu