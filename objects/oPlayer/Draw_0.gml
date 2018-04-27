///@desc draw self
// You can write your code in this editor

draw_self();


draw_set_color(c_black);
draw_set_halign(fa_center)

//find our tile type and display it
var tile_type = tilemap_get_at_pixel(layer_tilemap_get_id("walls_extensions"), x+4, y-4) & tile_index_mask;
//var tile_type = find_tile_collision(x, y);

//draw_text(x+16, y, string(tile_type));
/*
if oGameControl.interact_key and !is_moving {
	var x_dir = sign(lengthdir_x(4, facing*90) );	var y_dir = sign(lengthdir_x(4, facing*90) );
	
	var xx = x + 4 * x_dir;		var yy = y + 4 * y_dir;
	
	var interactable = instance_place(xx, yy, parSolid);
	draw_text(x+16, y, string(interactable));
}*/

draw_set_color(c_white)
draw_set_halign(fa_left)