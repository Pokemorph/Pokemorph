/// @desc draw scroll, bar, and title

draw_sprite(options_volumebarback, image_index, x, y);
draw_sprite(options_volumebarmarker, image_index, bar_position, y);

//draw the title
draw_set_color(c_gray);
draw_set_halign(fa_middle);
draw_set_font(title_solid);
draw_text(x+sprite_width/2, y-48, string(text));
draw_set_color(c_ltgray);
draw_set_font(title_hollow);
draw_text(x+sprite_width/2, y-48, string(text));

//return modified values to defaults
draw_set_halign(fa_left);
draw_set_color(c_white);