/// @description draw self and debug
// You can write your code in this editor

if audio_is_playing(oGameControl.music) and oGameControl.music != snd_silence or audio_is_playing(oGameControl.intro) {
	image_speed = 1;
} else {
	image_speed = 0;
	image_index = 0;
}

draw_self();

draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)