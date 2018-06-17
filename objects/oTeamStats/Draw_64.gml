/// @description draw self
// You can write your code in this editor

//draw_set_alpha(0.2);
draw_sprite(sprite_index, state, x, y);

draw_set_color(c_black);
draw_set_alpha(1);
draw_set_halign(fa_left);

if state = 0 {	//the stats mode
	var type_1 = type_to_text(ds_grid_get(global.breedData, stats_breed.type1, morph.breed_ref) )
	var type_2 = type_to_text(ds_grid_get(global.breedData, stats_breed.type2, morph.breed_ref) )
	//var hpMax = string(morph.hp_max);
	
	draw_set_font(fnt_stats_bold);
	if type_2 = "Unknown"	draw_text(x+20, y+48, "Type: " + type_1 );
	else					draw_text(x+20, y+48, "Type: " + type_1 + "/" + type_2 );
	
	draw_set_font(fnt_stats);
	draw_text(x+20, y+88, "Level: " + string(morph.current_level) );
	draw_text(x+20, y+128, "Exp: " + string(round(morph.current_xp)) + "/" + string(global.experience[morph.current_level]) );
	draw_text(x+20, y+168, "HP: " + string(round(morph.hp_cur)) + "/" + string(round(morph.hp_max)) );
	draw_text(x+20, y+208, "Attack: " + string(round(morph.atk_cur)) );
	draw_text(x+20, y+248, "Defense: " + string(round(morph.def_cur)) );
	draw_text(x+20, y+288, "Special Attack: " + string(round(morph.spatk_cur)) );
	draw_text(x+20, y+328, "Special Defense: " + string(round(morph.spdef_cur)) );
	draw_text(x+20, y+368, "Speed: " + string(round(morph.spd_cur)) );
} else if state = 1 {	//moves mode
	draw_set_font(fnt_stats);
	if morph.moves_1 >= 0	{
		draw_set_halign(fa_left);
		draw_text(x+20, y+48, ds_grid_get(global.moves, move_stats.name, morph.moves_1));
		draw_text(x+20, y+78, type_to_text(ds_grid_get(global.moves, move_stats.type, morph.moves_1)));
		draw_set_halign(fa_right);
		draw_text(x+250, y+48, ds_grid_get(global.moves, move_stats.pwr, morph.moves_1));
		draw_text(x+250, y+78, ds_grid_get(global.moves, move_stats.accuracy, morph.moves_1));
	} if morph.moves_2 >= 0	{
		draw_set_halign(fa_left);
		draw_text(x+20, y+48+90, ds_grid_get(global.moves, move_stats.name, morph.moves_2));
		draw_text(x+20, y+78+90, type_to_text(ds_grid_get(global.moves, move_stats.type, morph.moves_2)));
		draw_set_halign(fa_right);
		draw_text(x+250, y+48+90, ds_grid_get(global.moves, move_stats.pwr, morph.moves_2));
		draw_text(x+250, y+78+90, ds_grid_get(global.moves, move_stats.accuracy, morph.moves_2));
	} if morph.moves_3 >= 0	{
		draw_set_halign(fa_left);
		draw_text(x+20, y+48+180, ds_grid_get(global.moves, move_stats.name, morph.moves_3));
		draw_text(x+20, y+78+180, type_to_text(ds_grid_get(global.moves, move_stats.type, morph.moves_3)));
		draw_set_halign(fa_right);
		draw_text(x+250, y+48+180, ds_grid_get(global.moves, move_stats.pwr, morph.moves_3));
		draw_text(x+250, y+78+180, ds_grid_get(global.moves, move_stats.accuracy, morph.moves_3));
	} if morph.moves_4 >= 0	{
		draw_set_halign(fa_left);
		draw_text(x+20, y+48+270, ds_grid_get(global.moves, move_stats.name, morph.moves_4));
		draw_text(x+20, y+78+270, type_to_text(ds_grid_get(global.moves, move_stats.type, morph.moves_4)));
		draw_set_halign(fa_right);
		draw_text(x+250, y+48+270, ds_grid_get(global.moves, move_stats.pwr, morph.moves_4));
		draw_text(x+250, y+78+270, ds_grid_get(global.moves, move_stats.accuracy, morph.moves_4));
	}
} else if state = 2 {	//history mode
	draw_set_font(fnt_stats);
	draw_text_ext(x+20, y+48, string(ds_grid_get(global.breedData, stats_breed.flavor_text, morph.breed_ref)), 20, sprite_width-40 );
}

draw_set_color(c_white);
draw_set_halign(fa_left);