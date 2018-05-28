/// @desc control state variables and the battle
// You can write your code in this editor

if battle_state == 0 {
	battle_text_message(random_battle_start_text(), random_battle_change_pokemon(pmon));
	battle_state++;
}