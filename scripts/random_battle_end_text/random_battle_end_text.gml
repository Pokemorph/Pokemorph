///@function random_battle_end_text()
///@argument "opponent_name"
///@argument player_victory

if instance_exists(oBattle)	{
	var text = "";
	var name = argument0;
	var vict = argument1;
	var rand = irandom_range(0, 9);
	
	if vict == true {
		switch rand {
			case 0: text = "You defeated " + name + "!"; break;
			case 1: text = name + " was defeated!"; break;
			case 2: text = "You defeated " + name + "!"; break;
			case 3: text = "You defeated " + name + "!"; break;
			case 4: text = "You defeated " + name + "!"; break;
			case 5: text = "You defeated " + name + "!"; break;
			case 6: text = "You defeated " + name + "!"; break;
			case 7: text = "You defeated " + name + "!"; break;
			case 8: text = "You defeated " + name + "!"; break;
			case 9: text = "You defeated " + name + "!"; break;
		}
	} else {
		switch rand {
			case 0: text = "You were defeated by " + name + "!"; break;
			case 1: text = "You were defeated by " + name + "!"; break;
			case 2: text = "You were defeated by " + name + "!"; break;
			case 3: text = "You were defeated by " + name + "!"; break;
			case 4: text = "You were defeated by " + name + "!"; break;
			case 5: text = "You were defeated by " + name + "!"; break;
			case 6: text = "You were defeated by " + name + "!"; break;
			case 7: text = "You were defeated by " + name + "!"; break;
			case 8: text = "You were defeated by " + name + "!"; break;
			case 9: text = "You were defeated by " + name + "!"; break;
		}
	}
	
	return text;
} else	return "";

/*

okay, so in 

Victory texts

