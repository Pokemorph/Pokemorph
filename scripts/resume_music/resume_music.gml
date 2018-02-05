///resume_music()


with oGameControl {
	music_pause = false;
	if intro != -1 {
		audio_play_sound(intro, 10, false);
	}
}
