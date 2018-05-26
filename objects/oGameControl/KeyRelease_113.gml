/// @desc create battle menu for testing purposes (delete)
// if battle exists, destroy it. If not, create it

if instance_exists(oBattle) {
	instance_destroy(oBattle);
} else if instance_exists(oPlayer) {
	var t = "default";
	var team = [new_pokemon(dex_id.Bulbasaur, 4), new_pokemon(dex_id.Bulbasaur, 3)];
	start_battle(t, team, terrain.field, "mus_wildBattle", scr_battleAI_basic, true, true);
	//instance_create_depth(0, 0, -25, oBattle);
	if instance_exists(oPlayer)	oPlayer.state=player_battle_state;
}
