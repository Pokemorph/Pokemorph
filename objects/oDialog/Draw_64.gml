/// @desc Draw textbox/text


draw_set_alpha(0.8)
draw_self();
draw_set_alpha(1)
draw_set_font(fnt_dialog);
draw_set_color(c_black);
draw_text(x+margin, y+margin/2, text_visible);
draw_set_color(c_white);