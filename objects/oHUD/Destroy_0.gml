/// @desc cleanup affixed menu
// You can write your code in this editor

for (var i=0; i<array_length_1d(buttons); i++) {
	if instance_exists(buttons[i])		with buttons[i]	{
		instance_destroy();
	}
}
