/// @description interaction code
// You can write your code in this editor


switch interact_state {
	case 0:
		look_at(self, oPlayer);
		say(name, "Hey, Bay. Are you looking for Eevee? I think she might be down by the bay, playing in the sand. Eevee sure likes this little town. You should bring her back more often.");
		break;
	case 1: 
		say(name, text[1]); 
		break;
	case 2:
		wait(0.5);
	case 3:
		say(global.BayName, "Uh ... sure.");
		break;
	case 4:
		var me = new_team(battle_willow, "Willow", scr_battleAI_basic, new_pokemon(dex_id.Eevee, 4), new_pokemon(dex_id.Bulbasaur, 4) )
		trainer_battle(terrain.field, "mus_trainerBattle", 50, me);
		break;
	case 5:
		say(name, "That was fun. We should do this again sometime.");
		break;
	default:
		oPlayer.state = player_idle_state;
		interact_state = 0;
		break;
}
