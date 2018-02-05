/// @desc Manage the Music
// You can write your code in this editor

if !audio_is_playing(music) and !audio_is_playing(intro) and !music_pause {
	audio_play_sound(music, 10, true);
} else if music_pause and audio_is_playing(music){
	audio_stop_sound(music);
} else if music_pause and audio_is_playing(intro){
	audio_stop_sound(intro);
}