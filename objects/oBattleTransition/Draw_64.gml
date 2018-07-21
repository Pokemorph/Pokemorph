/// @description draw self
// You can write your code in this editor

draw_sprite_ext(battle_transition_back, 0, 810, 400-separation, 1, 1, 0, c_white, image_alpha); //draw background top
draw_sprite_ext(battle_transition_back, 1, 810, 400+separation, 1, 1, 0, c_white, image_alpha); //draw background top

draw_sprite_ext(battle_transition_pokeball, 0, x, y-separation, ball_scale, ball_scale, image_angle+ball_angle, c_white, image_alpha); //draw background top
draw_sprite_ext(battle_transition_pokeball, 1, x, y+separation, ball_scale, ball_scale, image_angle+ball_angle, c_white, image_alpha); //draw background top
