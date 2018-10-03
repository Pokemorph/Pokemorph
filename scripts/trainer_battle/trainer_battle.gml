///@function trainer_battle()
///@description helper script uses scr_battle to generate a trainer battle with the specified teams
///@argument background_id
///@argument "music"
///@argument cash
///@argument enemy_trainer_0
///@argument ...

//start off by assigning our arguments a name
var back = argument[0]; var music = argument[1];
var cash = argument[2];

//gather player trainer data
var p = new_team(oPlayer.trainer_pic, oPlayer.trainer_name, oPlayer.ai_script, oPlayer.pokemon[0], oPlayer.pokemon[1], oPlayer.pokemon[2], oPlayer.pokemon[3], oPlayer.pokemon[4], oPlayer.pokemon[5])


var t1 = argument[3];
if argument_count > 4	var t2 = argument[4];
if argument_count > 5	var t3 = argument[5];

//call battle script using as many trainers as we were passed arguments for
if argument_count > 8	scr_battle(back, music, self, true, true, cash, p, p, p, t1, t2, t3);
else if argument_count > 7	scr_battle(back, music, self, true, true, cash, p, p, t1, t2);
else	scr_battle(back, music, self, true, true, cash, p, t1);