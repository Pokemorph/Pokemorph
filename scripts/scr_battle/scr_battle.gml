///@function scr_battle()
///@description starts a customizable battle with the player
///@argument background_id
///@argument "music"
///@argument parent_id
///@argument can_flee
///@argument can_catch
///@argument team_0
///@argument ...

//start by making sure the player has any battle-worthy pokemon before creating the battle
if argument_count == 6 {
	var p = new_team(oPlayer.trainer_pic, oPlayer.trainer_name, oPlayer.ai_script, oPlayer.pokemon[0], oPlayer.pokemon[1], oPlayer.pokemon[2], oPlayer.pokemon[3], oPlayer.pokemon[4], oPlayer.pokemon[5]);
} else {
	var p = argument[5];
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
	oPlayer.state=player_battle_state;
	
	if argument_count == 6 { //if only one combatant is defined for us, assume the player is the other one
		combatants[0] = p;
		combatants[1] = argument[5];
	} else	for ( var i = 0; i < argument_count-5; i++ ) {
		combatants[i] = argument[i+5];
		combatants[i].depth = depth-1;
	}
	combatant_count = round(array_length_1d(combatants)/2 );
	
	//run the event to set combatant positions and collect their names for the text
	//event_user(0);
}