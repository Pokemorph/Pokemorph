/// @desc create battle menu for testing purposes (delete)
// if battle exists, destroy it. If not, create it

if instance_exists(oBattle) {
	instance_destroy(oBattle);
} else if instance_exists(oPlayer) {
	var t = new_team(battle_willow, "Willow", scr_battleAI_basic, new_pokemon(dex_id.Bulbasaur, 4), new_pokemon(dex_id.Eevee_nm, 5) );
	scr_battle(terrain.field, "mus_wildBattle", noone, true, true, t);
}
