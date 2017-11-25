/// @desc create battle menu for testing purposes (delete)
// if battle exists, destroy it. If not, create it

if instance_exists(oBattle) {
	instance_destroy(oBattle);
} else {
	instance_create_depth(0, 0, -15, oBattle);
	if instance_exists(oPlayer)	oPlayer.state=player_battle_state;
}

/*
var battle = instance_nearest(0, 0, oBattle);
if battle == noone			battle = instance_create_depth(0, 0, -1, oBattle)
else						instance_destroy(oBattle)