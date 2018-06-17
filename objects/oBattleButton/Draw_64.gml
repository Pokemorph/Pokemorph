/// @description draw self and text
// You can write your code in this editor

// Inherit the parent event

if text == ""	{
	click = false;
	hover = false;
	active = false;
}
event_inherited();

draw_set_font(fnt_battle_buttons);
draw_set_color(c_black);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_text(x+32, y+(sprite_height/2)+1, text);
draw_set_valign(fa_top);
draw_set_color(c_white);