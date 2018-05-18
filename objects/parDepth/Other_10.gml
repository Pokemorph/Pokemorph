/// @description interaction event
// You can write your code in this editor

switch interact_state {
	default:
		oPlayer.state = player_idle_state;
		interact_state = 0;
}