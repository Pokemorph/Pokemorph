/// @desc initialize the menu

// Inherit the parent event
event_inherited();

//create buttons
buttons[0] = instance_create_depth(x+(sprite_width/2), y+(sprite_height-50), depth-1, oOptionsReturn);
buttons[1] = instance_create_depth(912, 250, depth-1, oOptionsSlider);
buttons[2] = instance_create_depth(1096, 250, depth-1, oOptionsSlider);
buttons[2].text = "Sounds"

//just for fun, let's store the previous song and replace it with mus_computer, then switch it back on close
last_song = oGameControl.music_name;
set_music("mus_computer");