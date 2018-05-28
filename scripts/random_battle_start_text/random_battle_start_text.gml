///@function random_battle_start_text()

if instance_exists(oBattle)	{
	var text = "";
	var rand = irandom_range(0, 9);
	if oBattle.enemy_trainer == "default" or oBattle.enemy_trainer == ""	{ // wild battle
		switch rand {
			case 0: text = "emon looks angry!"; break;
			case 1: text = "emon wants to fight!"; break;
			case 2: text = "emon ate your macaron!"; break;
			case 3: text = "emon tripped you!"; break;
			case 4: text = "emon fell on you!"; break;
			case 5: text = "emon snatched your bag!"; break;
			case 6: text = "emon grabbed your hat!"; break;
			case 7: text = "emon stole your sweetroll!"; break;
			case 8: text = "emon used Stare!"; break;
			case 9: text = "emon is throwing a tantrum!"; break;
		}
	} else {	//	trainer battle section
		switch rand {
			case 0: text = "etrain challenges you!"; break;
			case 1: text = "etrain insulted your mother!"; break;
			case 2: text = "etrain grabbed you!"; break;
			case 3: text = "etrain glared at you!"; break;
			case 4: text = "etrain flipped you off!"; break;
			case 5: text = "etrain was feeling up your pokemon!"; break;
			case 6: text = "etrain wants to see your skills!"; break;
			case 7: text = "etrain insulted you!"; break;
			case 8: text = "etrain stole your hat!"; break;
			case 9: text = "etrain ate your lunch!"; break;
		}
	}
	
	return text;
} else	return "";