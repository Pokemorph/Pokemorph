/// @description Draw components
// You can write your code in this editor

//start by drawing the background
draw_set_color(c_white);
draw_set_alpha(0.8);
draw_self();

//only draw remainder if active morph exists
if instance_exists(active_morph)	{
	//now before changing draw color to black for the text, draw the bars
	draw_set_alpha(1);
	var hp_ratio = active_morph.hp_cur/active_morph.hp_max;
	draw_sprite_part(battle_healthbar, 0, 0, 0, hp_width*hp_ratio, hp_height, x+6, y+20)
	//if current level is at max(50), show exp bar as full. Otherwise, show progress to next level
	if active_morph.current_level < 50	{
		var exp_max = global.experience[active_morph.current_level];
		var exp_ratio = active_morph.current_xp/exp_max;
	} else								var exp_ratio = 1;
	draw_sprite_part(battle_expbar, 0, 0, 0, exp_width*exp_ratio, exp_height, x+6, y+30);

	//draw the nickname and level
	draw_set_color(c_black);
	draw_set_font(fnt_stats);
	if is_string(active_morph.nickname)		draw_text(x+8, y, active_morph.nickname);
	draw_text(x+132, y, string(active_morph.current_level) );
}

//draw the boxes around the hp and exp bars
draw_rectangle(x+6, y+20, x+6+hp_width, y+20+hp_height, true);
draw_rectangle(x+6, y+30, x+6+exp_width, y+30+exp_height, true);

//clean up universal draw functions
draw_set_color(c_white);