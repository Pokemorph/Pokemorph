/// @desc Manage the Music
// You can write your code in this editor

audio_master_gain(volume_master);

if !audio_is_playing(music) and !audio_is_playing(intro) {
	audio_play_sound(music, 16, true);
}
//audio_sound_get_gain(music)