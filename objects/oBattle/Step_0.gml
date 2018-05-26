/// @desc control state variables and the battle
// You can write your code in this editor

if battle_state == 0 {
	text_box.text[0] = "emon wants to fight!";
	text_box.text[1] = "Go pmon!";
	with text_box event_user(1);
	
	pmon.x = xx+180; pmon.y = yy+180;
	emon.x = xx+380; emon.y = yy;
	battle_state++;
}