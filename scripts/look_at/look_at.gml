/// @function look_at();
/// @description Turn to face selected target.
/// @arg target

var target = argument0;
if sprite_exists(target)	 direction = point_direction(x, y, target.x, target.y)
