/// @desc control slider bar

if active {
	tracker = round(global.winmouse_x - x - 6);
	tracker = clamp(tracker, 0, 100);
	bar_position = x + tracker + 6;
}