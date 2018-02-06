/// @desc initialize menu

// Position hud menu on screen
y = 160; x = 1220-sprite_width;

state = 0;
buttons = [];
buttons[0] = instance_create_depth(x, y+24, depth-1, ohud_options);