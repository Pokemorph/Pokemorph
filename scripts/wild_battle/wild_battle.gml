///@function wild_battle()
///@description helper script uses scr_battle to generate a wild battle with the specified pokemon
///@argument background_id
///@argument "music"
///@argument pokemon_0
///@argument ...

//start off by assigning our arguments a name
var back = argument[0]; var music = argument[1];
var p = []; p[0] = argument[2]; //first pokemon is not optional

//now grab any additional pokemon from the arguments and add them to the array
if argument_count > 3	p[1] = argument[3];
if argument_count > 4	p[2] = argument[4];
if argument_count > 5	p[3] = argument[5];
if argument_count > 6	p[4] = argument[6];
if argument_count > 7	p[5] = argument[7];

//create a combatant object using the gathered array
var n = new_team(noone, "", scr_battleAI_basic, p[0]);
n.pokemon = p;

//and finally, call the battle script using our new team and the specified background and music
scr_battle(back, music, true, true, n);