///@function get_combatants_name()
///@description gets trainer name if one exists, or first pokemon otherwise
///@argument combatant_id_1...

var c = []; var n = []; var name = "";

for ( var i = 0; i < argument_count; i++ ) {
	c[i] = argument[i];
	n[i] = c[i].trainer_name;
}

if array_length_1d(n) > 0 {
	if n[0] = "default" or n[0] == "Deadman" or n[0] == "" { //no trainer here
		n[0] = c[0].pokemon[0];
		name += n[0].nickname;
	} else {
		name += n[0];
	}
} if array_length_1d(n) > 1 {
	if n[1] = "default" or n[1] == "Deadman" or n[1] == "" { //no trainer here
		n[1] = c[1].pokemon[0];
		name += " and " + n[1].nickname;
	} else {
		name += " and " + n[1];
	}
} if array_length_1d(n) > 2 {
	if n[2] = "default" or n[2] == "Deadman" or n[2] == "" { //no trainer here
		n[2] = c[2].pokemon[0];
		name += " and " + n[2].nickname;
	} else {
		name += " and " + n[2];
	}
}

return name;