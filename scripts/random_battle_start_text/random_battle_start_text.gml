///@function random_battle_start_text()
///@description generates a random text
///@argument enemy_name
///@argument is_trainer

if instance_exists(oBattle)	{
	var text = "";
	var name = argument0;
	var rand = irandom_range(0, 9);
	if argument1 == false	{ // wild battle
		switch rand {
			case 0: text = name + " looks angry!"; break;
			case 1: text = name + " wants to fight!"; break;
			case 2: text = name + " ate your macaron!"; break;
			case 3: text = name + " tripped you!"; break;
			case 4: text = name + " fell on you!"; break;
			case 5: text = name + " snatched your bag!"; break;
			case 6: text = name + " grabbed your hat!"; break;
			case 7: text = name + " stole your sweetroll!"; break;
			case 8: text = name + " used Stare!"; break;
			case 9: text = name + " is throwing a tantrum!"; break;
		}
	} else {	//	trainer battle section
		switch rand {
			case 0: text = name + " challenges you!"; break;
			case 1: text = name + " insulted your mother!"; break;
			case 2: text = name + " grabbed you!"; break;
			case 3: text = name + " glared at you!"; break;
			case 4: text = name + " flipped you off!"; break;
			case 5: text = name + " was feeling up your pokemon!"; break;
			case 6: text = name + " wants to see your skills!"; break;
			case 7: text = name + " insulted you!"; break;
			case 8: text = name + " stole your hat!"; break;
			case 9: text = name + " ate your lunch!"; break;
		}
	}
	
	return text;
} else	return "";