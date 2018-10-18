/// @description interaction code
// You can write your code in this editor


switch interact_state {
	case 0:
		look_at(self, oPlayer);
		say(name, "Hey, Bay. Are you looking for Eevee? I think she might be down by the bay, playing in the sand. Eevee sure likes this little town. You should bring her back more often.");
		break;
	case 1: 
		ask(name, "You wanna have a practice battle with me?", "Yes", "No", "Maybe?");
		break;
	case 2:
		if answer == 0 {
			say(global.BayName, "Uh ... sure.");
		} else if answer == 1 {
			say(global.BayName, "No thanks, Willow.");
		} else {
			say(global.BayName, "Um, maybe?");
		}
		break;
	case 3:
		if answer == 0 {
			var me = new_team(battle_willow, "Willow", scr_battleAI_basic, new_pokemon(dex_id.Eevee, 4), new_pokemon(dex_id.Bulbasaur, 4) )
			trainer_battle(terrain.field, "mus_trainerBattle", 50, me);
		} else if answer == 1 {
			wait(0);
		} else {
			wait(0);
		}
		break;
	case 4:
		if answer == 0 {
			say(name, "That was fun. We should do this again sometime.");
		} else if answer == 1 {
			say(name, "That's okay, we can fight later. I think your dad had something to tell you. He's in your house, just up there.");
		} else {
			say(name, "Oh, silly Bay. You have to be more decisive!");
		}
		break;
	default:
		oPlayer.state = player_idle_state;
		interact_state = 0;
		answer = -1;
		break;
}
