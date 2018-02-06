/// @function set_music("sound_id")
/// @description Change the active music to a new track, including its intro, unless it is already playing.
/// @param "sound_id" 

var sound_id = argument0;

var sound = asset_get_index(string(sound_id));
var sound_intro = asset_get_index(string(sound_id)+"_intro");

with oGameControl {
	if sound != music {
		if audio_is_playing(music)		audio_stop_sound(music)
		else if audio_is_playing(intro)	audio_stop_sound(intro)
		music_name = sound_id;
		music = sound;
		intro = sound_intro;
	
		//music_pause = false;
		if sound_intro != -1 {
			audio_play_sound(sound_intro, 10, false);
		}
	}
}
