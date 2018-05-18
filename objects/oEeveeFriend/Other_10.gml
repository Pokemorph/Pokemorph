/// @description interaction code
// You can write your code in this editor

//audio_play_sound(snd_sxy_lick, 1, false);
switch interact_state {
	case 0:
		look_at(oPlayer);
		say(name, "Bulba!");
		break;
	case 1: 
		give_pokemon(new_pokemon(dex_id.Bulbasaur, 5));
		audio_play_sound(snd_sxy_lick, 0, false);
		say("", "Eevee's friend has joined your party!");
		break;
	default:
		oPlayer.state = player_idle_state;
		interact_state = 0;
		instance_destroy();
		break;
}
