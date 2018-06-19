/// @desc Draw textbox/text

draw_set_color(c_white);
draw_set_alpha(0.8)
draw_self();
draw_set_alpha(1)
draw_set_color(c_black);
draw_set_font(fnt_dialog_bold);
draw_text(x+margin*2, y+margin/2, name);
draw_set_font(fnt_dialog);
draw_text(x+margin, y+24, text_visible);
//draw_text(x+margin, y-24, string(cutscene) );
draw_set_color(c_white);