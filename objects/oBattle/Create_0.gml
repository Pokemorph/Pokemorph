/// @desc initialize battle variables

//control battle background position
if instance_exists(oCamera) {
	xx = oCamera.x - 268;
	yy = oCamera.y - 290;
} else {
	xx = 400;
	yy = 160;
} x = xx - irandom(200); y = yy - irandom(100);
image_index = 0

//get active menus and destroy them (for now, should only affect oHUD)
hud = false;
if instance_exists(oHUD) with oHUD {
	other.hud = true;
	instance_destroy();
} menu = noone; text_box = instance_create_depth(xx, yy+376, depth-1, oBattleText);

//store the room music to switch back after battle (actual song change in battle caller script)
if oGameControl.music_name = "mus_trainerEncounter"		song = oGameControl.last_song;
else if oGameControl.music_name = "mus_teamRocket"		song = oGameControl.last_song;
else if oGameControl.music_name = "snd_silence"			song = oGameControl.last_song;
else													song = oGameControl.music_name;


/*
	Battle Data Section
	
	edges of playable screen: 400-x1, 160-y1, 1219-x2, 640-y2
*/

parent = noone;				//set this to an instance id to advance cutscene when battle ends
combatants = [];			//an array to store all combatant objects used by this battle
active_pokemon = noone;		//use this to store the currently active pokemon
active_combatant = 0		//iterator for tracking the active combat space
turn_phase = 0;				//use this to track command, sort, and execution phases of turns
turn_count = 0;				//keeps track of turns passed; useful for stats and multi-turn effects
actions_list = ds_grid_create(6, 5)				//used for sorting actions before execution
ds_grid_clear(actions_list, noone);	//will store user_id, action_type, action_data, action_target, priority
last_action = noone; last_action_data = noone;	//these two store the last chosen action
last_action_target = noone;
player_x = [xx, xx+200, xx+400]; player_y = yy+76;
enemy_x = [xx+460, xx+260, xx+60]; enemy_y = yy;//these store positions of different combatants
stats_x = [400, 415, 430, 1013, 1028, 1043];
stats_y = [160, 200, 240, 360, 400, 440];		//store the positions of stat blocks