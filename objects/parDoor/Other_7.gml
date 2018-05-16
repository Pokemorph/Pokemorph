/// @description stop animation after once
// You can write your code in this editor

image_speed = 0;
if solid image_index = 0;//if marked solid at end of animation, door is closed
else image_index = image_number-1;//if not solid, door is open, so end on last frame
oPlayer.state = player_idle_state;