///@function start_battle()
///@description starts a battle with the player
///@argument trainer
///@argument team_list
///@argument background_id
///@argument music
///@argument ai_script
///@argument can_flee
///@argument can_catch

var trainer = argument0;
var team = argument1;
var back_id = argument2;
var mus = argument3;
var ai_script = argument4;
var can_flee = argument5;
var can_catch = argument6;

with instance_create_depth(0, 0, -15, oBattle) {
	image_index = back_id;
	enemy_team = team;
	enemy_trainer = trainer;
	flee = can_flee;
	enemy_ai = ai_script;
	capture = can_catch;
	emon = enemy_team[0];
	event_user(0);
}