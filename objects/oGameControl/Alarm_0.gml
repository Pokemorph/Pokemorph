/// @description Center Window
// center the window in an alarm, because this function must occur 1 frame after resizing

window_center();
if window_get_x() < 0	{
	show_message("Window position at " + string(window_get_x()) + ", " + string(window_get_y()) );
	window_set_position(0, window_get_y());
} if window_get_y() < 0	{
	show_message("Window position at " + string(window_get_x()) + ", " + string(window_get_y()) );
	window_set_position(window_get_x(), 0);
}