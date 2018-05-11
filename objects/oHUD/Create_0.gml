/// @desc initialize menu

// Position hud menu on screen
y = 160; x = 1220-sprite_width;

state = 0;
buttons = [];
var i = 6;
buttons[i] = instance_create_depth(x, y+24+(50*i), depth-1, parButton);
buttons[i].sprite_index = spr_hud_quit;
i = 5;
buttons[i] = instance_create_depth(x, y+24+(50*i), depth-1, parButton);
buttons[i].sprite_index = spr_hud_options;
i = 4;
buttons[i] = instance_create_depth(x, y+24+(50*i), depth-1, parButton);
buttons[i].sprite_index = spr_hud_save;
i = 3;
buttons[i] = instance_create_depth(x, y+24+(50*i), depth-1, parButton);
buttons[i].sprite_index = spr_hud_player;
i = 2;
buttons[i] = instance_create_depth(x, y+24+(50*i), depth-1, parButton);
buttons[i].sprite_index = spr_hud_items;
i = 1;
buttons[i] = instance_create_depth(x, y+24+(50*i), depth-1, parButton);
buttons[i].sprite_index = spr_hud_pokemorphs;
i = 0;
buttons[i] = instance_create_depth(x, y+24+(50*i), depth-1, parButton);
buttons[i].sprite_index = spr_hud_pokedex;