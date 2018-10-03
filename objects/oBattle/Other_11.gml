/// @description end battle animation

//before we get started, let's find the winner of the battle. We'll use this for dialog and money etc
var enemy_hp = 0; var player_hp = 0;
for (var i = 0; i < combatant_count; i++) {
	var act = combatants[i].active_pokemon;
	if instance_exists(act)	player_hp += act.hp_cur;
} for (var i = combatant_count; i < array_length_1d(combatants); i++) {
	var act = combatants[i].active_pokemon;
	if instance_exists(act)	enemy_hp += act.hp_cur;
}
var victory = sign(player_hp); //returns 1 or TRUE if player wins, and 0 -1 or FALSE otherwise

if animation_state == 0 {
	//start by checking each combatant for a trainer, and moving it into position at the side if one exists
	if combatant_count == 1 { //for a standard battle
		if sprite_exists(combatants[0].trainer_pic) {
			combatants[0].x = player_x[0]-1000; 
			combatants[0].y = player_y;
			combatants[0].sprite_index = combatants[0].trainer_pic;
		} if sprite_exists(combatants[1].trainer_pic) {
			combatants[1].x = enemy_x[0]+1000; 
			combatants[1].y = enemy_y;
			combatants[1].sprite_index = combatants[1].trainer_pic;
		}
	} else if combatant_count == 2 { //for a double battle
		if sprite_exists(combatants[0].trainer_pic) {
			combatants[0].x = player_x[0]-1000; 
			combatants[0].y = player_y;
			combatants[0].sprite_index = combatants[0].trainer_pic;
		} if sprite_exists(combatants[1].trainer_pic) {
			combatants[1].x = player_x[2]-1000; 
			combatants[1].y = player_y;
			combatants[1].sprite_index = combatants[1].trainer_pic;
		} if sprite_exists(combatants[2].trainer_pic) {
			combatants[2].x = enemy_x[0]+1000; 
			combatants[2].y = enemy_y;
			combatants[2].sprite_index = combatants[2].trainer_pic;
		} if sprite_exists(combatants[3].trainer_pic) {
			combatants[3].x = enemy_x[2]+1000; 
			combatants[3].y = enemy_y;
			combatants[3].sprite_index = combatants[3].trainer_pic;
		}
	} else if combatant_count == 3 { //and now for triple battle
		if sprite_exists(combatants[0].trainer_pic) {
			combatants[0].x = player_x[0]-1000; 
			combatants[0].y = player_y;
			combatants[0].sprite_index = combatants[0].trainer_pic;
		} if sprite_exists(combatants[1].trainer_pic) {
			combatants[1].x = player_x[1]-1000; 
			combatants[1].y = player_y;
			combatants[1].sprite_index = combatants[1].trainer_pic;
		} if sprite_exists(combatants[2].trainer_pic) {
			combatants[2].x = player_x[2]-1000; 
			combatants[2].y = player_y;
			combatants[2].sprite_index = combatants[2].trainer_pic;
		} if sprite_exists(combatants[3].trainer_pic) {
			combatants[3].x = enemy_x[0]+1000; 
			combatants[3].y = enemy_y;
			combatants[3].sprite_index = combatants[3].trainer_pic;
		} if sprite_exists(combatants[4].trainer_pic) {
			combatants[4].x = enemy_x[1]+1000; 
			combatants[4].y = enemy_y;
			combatants[4].sprite_index = combatants[4].trainer_pic;
		} if sprite_exists(combatants[5].trainer_pic) {
			combatants[5].x = enemy_x[2]+1000; 
			combatants[5].y = enemy_y;
			combatants[5].sprite_index = combatants[5].trainer_pic;
		}
	}
	//and now that placement is done, move to phase 2
	animation_state++;
} else if animation_state == 1 {
	if combatants[0].x < player_x[0]-5 { //each step they're out of place, move the pieces closer to position
		for (var i = 0; i < combatant_count; i++) {
			if sprite_exists(combatants[i].trainer_pic)		combatants[i].x += 5;
		} for (var i = combatant_count; i < array_length_1d(combatants); i++) {
			if sprite_exists(combatants[i].trainer_pic)		combatants[i].x -= 5;
		}
	} else { //now place the actors in their final positions and transition to next phase
		var n = combatants[combatant_count].trainer_name; //use this to gather trainer names
		if combatant_count == 1 { //for a standard battle
			combatants[0].x = player_x[0];
			combatants[1].x = enemy_x[0];
			n = get_combatants_name(combatants[1]);
		} else if combatant_count == 2 { //for a double battle
			combatants[0].x = player_x[0];
			combatants[1].x = player_x[2];
			combatants[2].x = enemy_x[0];
			combatants[3].x = enemy_x[2];
			n = get_combatants_name(combatants[2], combatants[3]);
		} else if combatant_count == 3 { //and for triple battle
			combatants[0].x = player_x[0];
			combatants[1].x = player_x[1];
			combatants[2].x = player_x[2];
			combatants[3].x = enemy_x[0];
			combatants[4].x = enemy_x[1];
			combatants[5].x = enemy_x[2];
			n = get_combatants_name(combatants[3], combatants[4], combatants[5]);
		}
		//display end battle text and start the text timer, then advance the state
		battle_text_message(random_battle_end_text(n, victory));
		text_timer = 3 * GAME_SPEED;
		animation_state++;
	}
} else if animation_state == 2 {
	if text_box.text[0] == "" {
		text_timer = 0;
	}
	if text_timer > 0	{
		text_timer--;
	} else { //text timer has finished, calculate money and display money text
		
		if money > 0 {
			if victory == true {
				battle_text_message("You received " + string(money) + " dollars!");
			} else {
				battle_text_message("You lost " + string(money) + " dollars!");
			}
			
			audio_play_sound(snd_get_money, 1, false);
			text_timer = 3 * GAME_SPEED;
			animation_state++;
		} else animation_state++;
	}
} else if animation_state == 3 {
	if text_box.text[0] == "" {
		text_timer = 0;
	}
	if text_timer > 0	{
		text_timer--;
	} else { //text timer has finished, start the fadeout
		instance_create_depth(x, y, depth, oFade);
		animation_state++;
	}
} else if animation_state == 4 {
	if !instance_exists(oFade) {
		image_alpha = 0;
		animation_state = 9;
	} else {
		var f = instance_nearest(x, y, oFade);
		if f.target_alpha <= 0 { //if fade is fading out, make everyone invisible
			image_alpha = 0;
			text_box.image_alpha = 0;
			//make each combatant invisible before the fadein reveals them
			for (var i = 0; i < array_length_1d(combatants); i++) { //for each combatant in combat
				//destroy the stats display
				if instance_exists(combatants[i].stats)		with combatants[i].stats	image_alpha = 0;
				//and then, the combatant itself
				if instance_exists(combatants[i])			with combatants[i]			image_alpha = 0;
	
			}
			animation_state++;
		}
	}
} else if animation_state == 5 {
	if !instance_exists(oFade) {
		animation_state = 9;
	}
} else if animation_state == 9 {
	instance_destroy();
}

/*	pseudocode
Pokemon fainted
Winner gained exp points
Trainer is about to use pokemon
...
Pokemon fainted
winner gained exp points
player defeated trainer; trainer switches battle state to end battle sequence
... and, begin user event 1

if trainer exists, 
	move combatant off screen
	change to trainer art
	start moving combatant back to position
when in position, display trainer end-battle dialog
player got money for winning
fadeout
set battle to invisible
fadein
destroy battle object

okay, I believe I'm at the final stage of executing this pseudo-code. The AI is now triggering a new battle state
which calls this event, and this event performs the battle destroy. Now it's time to animate.
so, what's my sequence? Once the AI has been called to trigger this event, the move code has already done the faint
and distributed exp (or will have, once I build that part of the move code). Seems the next part would be sliding
the trainer into position and displaying the battle end text, then handing out money and fading out of battle
Okay, so that leaves figuring out exactly what place everything ends up in
looks like oBattleMove leaves the targeted combatant in the correct place, just with a blank sprite
so the opening sequence sets oBattle to invisible and creates oBattleTransition to perform the fade
but, that object also uses the pokeball animation. Do we need that at battle's end or just the fadeout/in?
well, first, I need to handle the trainer transition.

point to note here, in the original game design, they have pretty standard intro and outro texts.
#trainer would like to battle
defeated #trainer
following these texts, they have a customized statement unique to each trainer
okay so, I might as well get over myself and just plug in some management for customized text. I only need one
beginning and one ending statement for each battle, and I can create them in vars
Do I still need the random standard beginning/end dialog?
Short answer, yes. Even if I go for certain parts being standard, I still want the wild fights to implement some
randomness. What I could do, even, is run the random text if the appropriate text var is blank.

hmm, small problem. How do I calculate a cash reward? Do I have to feed it into the battle object? That is how
humbird0's version does it. He feeds in an encounter text, post-battle text, and cash along with the other data