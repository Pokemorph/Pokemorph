/// @desc draw the text
draw_set_color(c_white);
draw_self();
draw_set_font(fnt_dialog);
draw_set_color(c_black);
draw_text(x+margin, y+margin, text_visible);
draw_set_color(c_white);