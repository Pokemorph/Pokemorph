/// @desc Handle button functions

if instance_exists(buttons[0]) and buttons[0].click = true	{
	instance_destroy();		// destroy the menu, reverting to screen above
}