/// @description interaction code
// You can write your code in this editor

//audio_play_sound(snd_sxy_lick, 1, false);
switch interact_state {
	case 0:
		look_at(self, oPlayer);
		say(name, "Vee!");
		break;
	case 1: 
		var n = new_pokemon(dex_id.Eevee, 5);
		n.nickname = global.EeveeName;
		give_pokemon(n);
		say("", "Eevee has joined your party!");
		break;
	default:
		oPlayer.state = player_idle_state;
		interact_state = 0;
		instance_destroy();
		break;
}
