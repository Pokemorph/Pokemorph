/// @function look_at();
/// @description Turn to face selected target.
/// @arg actor
/// @arg target

var actor = argument0;
var target = argument1;
if instance_exists(actor) and instance_exists(target)	with actor {
	direction = point_direction(x, y, target.x, target.y);
}