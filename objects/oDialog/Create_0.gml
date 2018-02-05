/// @desc initialize dialog object
// You can write your code in this editor

text[0] = "Hello and welcome to the world of POKeMON!";
text_visible = "";
text_count = 0;
text_page = 0;
spd = oGameControl.text_speed;
name = "";
flip = false;
cutscene = noone;
input_timer = 2;

margin = 12;
width = sprite_width - (margin*2);

x = 400;
y = 640-sprite_height;