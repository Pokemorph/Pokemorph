/// @description interaction code
// You can write your code in this editor

switch interact_state {
	case 0: 
		say("Theodore Woods", "Hey there, kiddo. You're home early. You want some pancakes?");
		break;
	default:
		oPlayer.state = player_idle_state;
		interact_state = 0;
}