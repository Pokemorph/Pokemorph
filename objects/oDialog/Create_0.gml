/// @desc initialize dialog object
// You can write your code in this editor

text[0] = "Hello and welcome to the world of POKeMON!";
choices = [];
menu_array = [];
text_visible = "";
text_count = 0;
text_page = 0;
spd = oGameControl.text_speed;
name = "Default";
flip = false;
parent = noone;
input_timer = 2;

margin = 16;
width = sprite_width - (margin*2);

x = 405;
y = 540;

/*
okay, so how do I handle the choices display? I know I need to display it in multiple parts,
but I also need collision in multiple parts, text associated with each part, and an arrow pointing
at each piece of text as it detects mouse collisions
It's sounding very much to me like I need a new object. 