/// @function wait();
/// @description Wait a specified number of seconds (a value of 0 means 1 frame).
/// @arg seconds

var sec = argument0*60;
if sec <= 0		sec = 1;
alarm[1] = sec;
interact_state++;