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
}

//vars to control fade transition
battle_state = 0;
target_alpha = 1;
alpha = 0;

//variables to hold the necessary player-team and enemy-team pokemon data
player_team = oPlayer.pokemon;
enemy_team[0] = noone;
enemy_ai = noone;
player_trainer = global.BayName;
enemy_trainer = "";
flee = false;
catch = true;
pmon = player_team[0]; ppic = noone;
emon = noone; epic = noone;
player_x = xx; player_y = yy+76;
enemy_x = xx+460; enemy_y = yy;

//functional battle vars (turn, etc)
current_turn = 0;
current_player = 0;	//set this to 0 for player control and increment it for the ai's control

//initialize the battle menu
menu = instance_create_depth(xx, yy, depth, oBattleMenu);
text_box = instance_create_depth(xx, yy+376, depth-1, oBattleText);

/*
	-----------CODE PLANNING!!!!!!
	Okay, so what needs to happen, in sequence, after a battle is called for?
		A battle object should be instantiated
		Battle object should be fed pertinent data (enemy team, background, music, etc)
		Once data is absorbed, battle object should fade-out and move to battle room
		Once in battle room, battle object should fade-in and place trainers
		Opponent should slide to back of room and deploy first pokemon
		{Buttons should appear to select first pokemon
		Buttons should disappear, player should slide out of sight and deploy chosen pokemon}
		Skip last two; instead, auto-select first pokemon in both teams
		Main battle loop should begin
			Player turn activates command buttons and awaits instruction
			Battle object acts on command
			Turn rolls over
			If enemy is not dead, enemy chooses action (for now, ATTACK)
			If a combatant loses health, call next one if available
			If no new combatant is available, end battle loop
			Otherwise, roll-over turn to player
				Now, how to administer the main battle loop...?
				I could use states, like heartbeast, and cycle through those states until
				an exit clause is reached. In fact, as I think about it, that's the only
				way I can think of, whether those states are built-in or in script form.
		On battle loop end, divide and administer exp and give out cash
		Gather any necessary battle statistics
		Fade-out and move back to last room
		Fade-in
		Pass gathered data to the caller
		Cleanup data and destroy battle object