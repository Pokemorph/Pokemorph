/// @desc draw self
// You can write your code in this editor

draw_self();

if text != "" {
	
	if active {
		draw_sprite(spr_dialog_arrow, 1, x+4, y);
	} else if hover {
		draw_sprite(spr_dialog_arrow, 0, x+4, y);
	}
	
	draw_set_font(fnt_dialog);
	draw_set_color(c_black);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	draw_text(x+24, y+sprite_height/2+1, text);
	draw_set_color(c_white);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}