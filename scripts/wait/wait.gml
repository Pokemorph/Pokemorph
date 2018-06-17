/// @function wait();
/// @description Wait a specified number of seconds (a value of 0 means 1 frame).
/// @arg seconds

var sec = argument0*60;
if sec <= 0		sec = 1;
interact_state++;
if instance_exists(oPlayer) oPlayer.state = player_talking_state;
alarm[1] = sec;