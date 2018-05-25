/// @desc Initialize menu
// You can write your code in this editor

// Inherit the parent event
event_inherited();

x = 896; y = 480;

buttons[0] = instance_create_depth(x+18, y+18, depth-1, parButton); 
buttons[0].sprite_index = battle_button_attack;
buttons[1] = instance_create_depth(x+176, y+18, depth-1, parButton); 
buttons[1].sprite_index = battle_button_morphs;
buttons[2] = instance_create_depth(x+18, y+80, depth-1, parButton); 
buttons[2].sprite_index = battle_button_items;
buttons[3] = instance_create_depth(x+176, y+80, depth-1, parButton); 
buttons[3].sprite_index = battle_button_flee;