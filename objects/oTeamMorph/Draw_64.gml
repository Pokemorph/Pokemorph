/// @desc draw self
// You can write your code in this editor

if selected {
	if hover image_index = 3;
	else	image_index = 2;
} else {
	if hover	image_index = 1;
	else			image_index = 0;
}

draw_self();

if morph != noone {
	draw_set_font(fnt_dialog);
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_set_halign(fa_left);
	var text_x = x+56; var text_y = y+12;
	draw_text(text_x, text_y, morph.nickname);
	text_x += 16; text_y += 18;
	draw_text(text_x, text_y, "Lvl " + string(morph.current_level));
	var gender = ds_grid_get(global.breedData, stats_breed.sex, morph.breed_ref);
	draw_sprite(team_frame_gender, gender, text_x+52, text_y);
	text_x = x+sprite_width-4;
	draw_set_halign(fa_right);
	draw_text(text_x, text_y, string(round(morph.hp_cur)) + "/" + string(round(morph.hp_max)));
	
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	var hp_ratio = morph.hp_cur / morph.hp_max;
	draw_sprite_part(team_frame_hp, 0, 0, 0, hp_ratio*72, 12, x+170, y+14);
	draw_sprite(morph.sprite_index, 11, x+10, y+62);
}