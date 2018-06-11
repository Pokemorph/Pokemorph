/// @description animation and state engine
// You can write your code in this editor

if state = 0	{ //calculate damage for later use and feed text to textbox to announce it
	target_hp = target.hp_cur-move_damage(user, move_id, target, false);
	var m = ds_grid_get(global.moves, move_stats.name, move_id);
	var n = user.nickname;
	battle_text_message(string(n) + " used " + string(m)); 
	state++;
} else if state = 1 {
	if oBattleText.text[0] = "" {
		if target_hp+1 < target.hp_cur			target.hp_cur = lerp(target.hp_cur, target_hp, 0.5);
		else if target_hp+1 >= target.hp_cur	{
			target.hp_cur = target_hp;
			state++;
		}
	}
} else if state = 2 {
	if target_hp <= 0 with oBattle {
		var temp = active_combatant;
		active_combatant = other.target_combatant_id;
		script_execute(combatants[active_combatant].ai_script);
		active_combatant = temp;
		other.state++;
	} else {
		state++;
	}
} else {
	instance_destroy();
}

/*	Okay, I need to figure out my sequence
First, the move is created, and it is given the user, target, and move data
for now, target will be automatically set to the enemy, and user to the player pokemon
Then, state 0 is executed. State 0 feeds text to the box, then increments to wait for text to complete


