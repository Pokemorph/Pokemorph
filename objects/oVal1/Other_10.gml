/// @description interaction code
// You can write your code in this editor

//audio_play_sound(snd_sxy_lick, 1, false);
switch interact_state {
	case 0:
		look_at(self, oPlayer);
		say(name, "Hello, friend, and welcome to our first functional demo of the new pokemorph engine! Now, I'm sure you've been wondering what we were up to back here, and why it's been so long with so little word.");
		break;
	case 1: 
		look(self, directions.right);
		say(name, "Suffice it to say, getting here has been a bigger feat than we ever could have anticipated. But if you look around now, I think you'll see our efforts are finally paying off. I hope it was worth the wait."); 
		break;
	case 2:
		look_at(self, oPlayer);
		say(name, "Now, there won't be any story yet. But that will come. Please feel free to look around, and let us know if anything doesn't work right.");
		break;
	default:
		oPlayer.state = player_idle_state;
		interact_state = 0;
		break;
}
