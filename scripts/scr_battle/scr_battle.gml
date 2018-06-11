///@function scr_battle()
///@description starts a customizable battle with the player
///@argument background_id
///@argument "music"
///@argument can_flee
///@argument can_catch
///@argument team_0
///@argument ...


with instance_create_depth(0, 0, -15, oBattle) {
	image_index = argument[0];
	set_music(argument[1]);
	flee = argument[2];
	capture = argument[3];
	
	if argument_count == 5 {
		combatants[0] = new_team(oPlayer.trainer_pic, oPlayer.trainer_name, oPlayer.ai_script, oPlayer.pokemon[0], oPlayer.pokemon[1], oPlayer.pokemon[2], oPlayer.pokemon[3], oPlayer.pokemon[4], oPlayer.pokemon[5]);
		combatants[1] = argument[4];
	} else	for ( var i = 0; i <= argument_count-4; i++ ) {
		combatants[i] = argument[i+4];
		combatants[i].depth = depth-1;
	}
	combatant_count = round(array_length_2d(combatants, 0)/2 );
	
	//set combatant positions and collect their names for the text
	
}