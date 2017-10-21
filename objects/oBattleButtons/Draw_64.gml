/// @description draw self here

var left = 0;
var width = sprite_width/frames;
if frames >= 3 {
	if click								left = width*2+1;
	else if hover							left = width+1;
} else if frames >= 2 and hover or click	left = width+1;

draw_sprite_part(sprite_index, image_index, left, 0, width, sprite_height, x, y);
//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);