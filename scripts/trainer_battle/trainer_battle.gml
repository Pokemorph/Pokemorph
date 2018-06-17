///@function trainer_battle()
///@description helper script uses scr_battle to generate a trainer battle with the specified teams
///@argument background_id
///@argument "music"
///@argument enemy_trainer_0
///@argument ...

//start off by assigning our arguments a name
var back = argument[0]; var music = argument[1];

//gather player trainer data
var p = new_team(oPlayer.trainer_pic, oPlayer.trainer_name, oPlayer.ai_script, oPlayer.pokemon[0], oPlayer.pokemon[1], oPlayer.pokemon[2], oPlayer.pokemon[3], oPlayer.pokemon[4], oPlayer.pokemon[5])

if argument_count > 4	scr_battle(back, music, self, true, true, p, p, p, argument[2], argument[3], argument[4]);
else if argument_count > 3	scr_battle(back, music, self, true, true, p, p, argument[2], argument[3]);
else	scr_battle(back, music, self, true, true, p, argument[2]);



//and finally, call the battle script using our new team and the specified background and music
scr_battle(back, music, self, true, true, n);