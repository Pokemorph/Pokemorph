/// @description animation and state engine
// You can write your code in this editor

if state == 0	{ //calculate damage for later use and feed text to textbox to announce it
	target_hp = target.hp_cur-move_damage(user, move_id, target, false);
	var m = ds_grid_get(global.moves, move_stats.name, move_id);
	var n = user.nickname;
	battle_text_message(string(n) + " used " + string(m));
	text_timer = 3*GAME_SPEED;
	state++;
} else if state == 1 {
	if oBattleText.text[0] == "" {
		text_timer = 0;
	}
	if text_timer > 0	{
		text_timer--;
	}
	else { //text timer has timed down or text is now blank, lower current health
		battle_text_message("");
		if target_hp+1 < target.hp_cur			target.hp_cur = lerp(target.hp_cur, target_hp, 0.5);
		else if target_hp+1 >= target.hp_cur	{
			target.hp_cur = target_hp;
			state++;
		}
	}
} else if state == 2 {
	if target_hp <= 0 {
		var target_combatant = oBattle.combatants[target_combatant_id];
		target_y = target_combatant.y;
		//audio_play_sound(snd_death);
		state++;
	} else {
		state = 9;
	}
} else if state == 3 { //target died, run death animation	
	var target_combatant = oBattle.combatants[target_combatant_id];
	var tar_y = oBattle.yy + 800
	if target_combatant.y+8 < tar_y { //if target is higher than designated spot, move it
		target_combatant.y += 8;
	} else { //else, send faint message and advance state
		target_combatant.y = target_y;
		target_combatant.sprite_index = battle_blank;
		battle_text_message(target.nickname + " has fainted!");
		text_timer = 3*GAME_SPEED;
		state++;
	}
} else if state == 4 { //continuing death animation, wait for faint text and then run combatant AI
	if oBattleText.text[0] == "" {
		text_timer = 0;
	}
	if text_timer > 0	{
		text_timer--;
	}
	else { //text timer has timed down or text is now blank, activate combatant AI
		with oBattle {
			var temp = active_combatant;
			active_combatant = other.target_combatant_id;
			script_execute(combatants[active_combatant].ai_script);
			active_combatant = temp;
		}
		state = 9;
	}
} else if state == 9 {
	oBattle.active_combatant++;
	instance_destroy(oBattleMove);
	//show_message("Completing move");
	
}