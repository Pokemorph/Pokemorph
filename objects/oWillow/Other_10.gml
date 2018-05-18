/// @description interaction code
// You can write your code in this editor

//audio_play_sound(snd_sxy_lick, 1, false);
switch interact_state {
	case 0:
		look_at(oPlayer);
		say(name, "Hey, Bay. Are you looking for Eevee? I think she might be down by the bay, playing in the sand. Eevee sure likes this little town. You should bring her back more often.");
		break;
	case 1: 
		say(name, text[1]); 
		break;
	case 2:
		say(global.BayName, "Uh ... sure.");
		break;
	default:
		oPlayer.state = player_idle_state;
		interact_state = 0;
		break;
}
