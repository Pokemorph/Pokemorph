/// @desc control slider bar

if active {
	tracker = round(oGameControl.winmouse_x - x - 6);
	clamp(tracker, 0, 100);
	bar_position = x + tracker + 6;
}