/// @desc test battles (delete later)
// if battle exists, destroy it. If not, create it

if instance_exists(oBattle) {
	instance_destroy(oBattle);
} else if instance_exists(oPlayer) {
	var p1 = new_team(oPlayer.trainer_pic, oPlayer.trainer_name, oPlayer.ai_script, oPlayer.pokemon[0], oPlayer.pokemon[1], oPlayer.pokemon[2], oPlayer.pokemon[3], oPlayer.pokemon[4], oPlayer.pokemon[5]);
	var t1 = new_team(battle_willow, "Willow", scr_battleAI_basic, new_pokemon(dex_id.Bulbasaur, 4), new_pokemon(dex_id.Eevee_nm, 5) );
	scr_battle(terrain.field, "mus_gymBattle", noone, true, true, 0, p1, t1);
}
