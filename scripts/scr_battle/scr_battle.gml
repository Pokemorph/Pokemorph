///@function scr_battle()
///@description starts a customizable battle with the player
///@argument background_id
///@argument "music"
///@argument parent_id
///@argument can_flee
///@argument can_catch
///@argument cash
///@argument team_0
///@argument ...

//start by making sure the player has any battle-worthy pokemon before creating the battle
var p = noone;
if argument_count == 7 {
	p = new_team(oPlayer.trainer_pic, oPlayer.trainer_name, oPlayer.ai_script, oPlayer.pokemon[0], oPlayer.pokemon[1], oPlayer.pokemon[2], oPlayer.pokemon[3], oPlayer.pokemon[4], oPlayer.pokemon[5]);
} else {
	p = argument[6];
}
if p.active_pokemon == noone	exit; 
else {
	var act = p.active_pokemon;
	if act.hp_cur <= 0	exit;
}

//generate the battle and initialize it
with instance_create_depth(0, 0, -15, oBattle) {
	image_index = argument[0];
	set_music(argument[1]);
	parent = argument[2];
	flee = argument[3];
	capture = argument[4];
	money = argument[5];
	oPlayer.state=player_battle_state;
	
	if argument_count == 7 { //if only one combatant is defined for us, assume the player is the other one
		combatants[0] = p;
		combatants[1] = argument[6];
	} else	for ( var i = 0; i < argument_count-6; i++ ) {
		combatants[i] = argument[i+6];
		combatants[i].depth = depth-1;
	}
	combatant_count = round(array_length_1d(combatants)/2 );
	
	//run the event to set combatant positions and collect their names for the text
	//event_user(0);
}