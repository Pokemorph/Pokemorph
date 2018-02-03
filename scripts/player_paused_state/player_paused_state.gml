//-----------Player Paused State due to opening menu
//in this state, controls are seized until the hud object is gone

animating = false;
if !instance_exists(parMenu) {
	state = player_idle_state;
}