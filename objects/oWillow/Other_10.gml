/// @description interaction code
// You can write your code in this editor

//audio_play_sound(snd_sxy_lick, 1, false);
switch interact_state {
	case 0:
		message_box("Hey, Bay. Are you looking for Eevee? I think she might be down by the bay, playing in the sand. Eevee sure likes this little town. You should bring her back more often.");
	default:
		oPlayer.state = player_idle_state;
}
