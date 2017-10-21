/// @description Insert description here
// You can write your code in this editor

if audio_is_playing(oGameControl.music) or audio_is_playing(oGameControl.intro) {
	image_speed = 1;
} else {
	image_speed = 0;
	image_index = 0;
}