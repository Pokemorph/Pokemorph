/// @desc Initialize menu
// You can write your code in this editor

// Inherit the parent event
event_inherited();

x = 896; y = 480;
state = 0;
active_morph = oPlayer.pokemon[0];

buttons[0] = instance_create_depth(x+18, y+18, depth-1, oBattleButton); buttons[0].text = "Attack";
buttons[1] = instance_create_depth(x+170, y+18, depth-1, oBattleButton); buttons[1].text = "Morphs";
buttons[2] = instance_create_depth(x+18, y+80, depth-1, oBattleButton); buttons[2].text = "Items";
buttons[3] = instance_create_depth(x+170, y+80, depth-1, oBattleButton); buttons[3].text = "Flee";