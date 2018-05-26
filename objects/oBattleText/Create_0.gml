/// @desc initialize dialog object
// You can write your code in this editor

text[0] = "Hello and welcome to the world of POKeMON!";
text_visible = "";
text_count = 0;
text_page = 0;
spd = oGameControl.text_speed;
input_timer = 2;
parent = instance_nearest(x, y, oBattle);

margin = 20;
width = sprite_width - (margin*2);