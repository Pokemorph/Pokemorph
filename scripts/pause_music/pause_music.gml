///pause_music()

with oGameControl {
	music_pause = true;
	if audio_is_playing(music){
		audio_stop_sound(music);
	} else if audio_is_playing(intro){
		audio_stop_sound(intro);
	}
}