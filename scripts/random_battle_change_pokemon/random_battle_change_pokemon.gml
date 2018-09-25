///@function random_battle_change_pokemon()
///@argument nickname

if instance_exists(oBattle)	{
	var text = "";
	var name = argument0;
	var rand = irandom_range(0, 9);
	
	switch rand {
		case 0: text = "Go get em, " + name + "!"; break;
		case 1: text = "Go " + name + "!"; break;
		case 2: text = "I believe in you, " + name + "!"; break;
		case 3: text = "You got this, " + name + "!"; break;
		case 4: text = "Into the fray, " + name + "! You can do it!"; break;
		case 5: text = "Finish this, " + name + "!"; break;
		case 6: text = "It's all you " + name + "!"; break;
		case 7: text = "Your turn, " + name + "!"; break;
		case 8: text = "You can do it, " + name + "!"; break;
		case 9: text = "Go " + name + "!"; break;
	}
	
	return text;
} else	return "";