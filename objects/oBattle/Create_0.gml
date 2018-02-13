/// @desc initialize battle variables

//control battle background position
if instance_exists(oCamera) {
	x = oCamera.x - 320;
	y = oCamera.y - 290;
} else {
	x = 400;
	y = 160;
}
x += irandom_range(-18, 6) * 8;	//-18, 6
image_index = 0

//vars to control fade transition
battle_state = 0;
target_alpha = 1;
alpha = 0;

//variables to hold the necessary player-team and enemy-team pokemon data
player_team = ds_list_create();
enemy_team = ds_list_create();
player_trainer = noone;
enemy_trainer = noone;

//functional battle vars (turn, etc)
current_turn = 0;


/*
	-----------CODE PLANNING!!!!!!
	Okay, so what needs to happen, in sequence, after a battle is called for?
		A battle object should be instantiated
		Battle object should be fed pertinent data (enemy team, background, music, etc)
		Once data is absorbed, battle object should fade-out and move to battle room
		Once in battle room, battle object should fade-in and place trainers
		Opponent should slide to back of room and deploy first pokemon
		Buttons should appear to select first pokemon
		Buttons should disappear, player should slide out of sight and deploy chosen pokemon
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