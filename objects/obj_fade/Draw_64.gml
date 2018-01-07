/// @desc Draw Fadeout
draw_set_color(fadeColor);
draw_set_alpha(image_alpha);

if (room != target) {
	image_alpha += fadeSpeed;
	if(image_alpha){
		oPlayer.x = xx;
		oPlayer.y = yy;
		room_goto(target);
	}
}else{
	image_alpha -= fadeSpeed;
	if(!image_alpha){
		instance_destroy();
	}
}

draw_rectangle(0, 0, view_wport*2, view_hport*2, false);
draw_set_alpha(1);