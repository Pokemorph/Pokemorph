//-----------Player Battle State
//in this state, controls are seized until the dialog box object is gone

animating = false;
if !instance_exists(oBattle) {
	state = player_idle_state;
}