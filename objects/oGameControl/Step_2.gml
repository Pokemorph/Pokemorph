/// @desc Manage the Music

// change master volume according to current settings
// master volume is a way for the game code to silence music without altering player settings
audio_master_gain(volume_master);

// loop the music when it ends, and shift from intro to song when music has been changed
if !audio_is_playing(music) and !audio_is_playing(intro) {
	audio_play_sound(music, 16, true);
}
//audio_sound_get_gain(music)