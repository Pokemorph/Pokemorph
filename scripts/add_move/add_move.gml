///@desc add_move(list_id, position, move_id, level, tm_id)
///@param list_id
///@param position
///@param move_id
///@param level

var list = argument[0];
var position = argument[1];
var move = argument[2];
var level = argument[3];

ds_grid_add(list, position, 0, move);
ds_grid_add(list, position, 1, level);