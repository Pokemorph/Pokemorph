/// @desc draw the menu
// You can write your code in this editor

draw_self();
if active_morph != noone {
	draw_sprite(team_back_pokeball, pokeball, x+260, y+32);
	var image = ds_grid_get(global.breedData, active_morph.breed_ref, stats_breed.picture);
	draw_sprite(image, battle_poses.front, x+256, y+64);

	draw_set_color(c_white);
	draw_set_font(fnt_title_solid);
	draw_set_halign(fa_center);
	draw_set_alpha(1);
	draw_text(x+435, y+16, active_morph.nickname);
	draw_text(x+435, y+48, ds_grid_get(global.breedData, active_morph.breed_ref, stats_breed.name) );
	draw_set_color(c_black);
	draw_set_font(fnt_title_hollow);
	draw_text(x+435, y+16, active_morph.nickname);
	draw_text(x+435, y+48, ds_grid_get(global.breedData, active_morph.breed_ref, stats_breed.name) );
	draw_set_color(c_white);
}