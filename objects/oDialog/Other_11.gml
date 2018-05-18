/// @desc format text
// this event will reformat the full text in order to tell gamemaker when to break a line

if (text != undefined) {

	//set font
	draw_set_font(fnt_dialog);
    
	//get page count
	var array_size = array_length_1d(text);
	var last_space = 0;
    
	//loop through pages
	for(var i = 0; i < array_size; i++) {
		//find and replace any instances of character names with the contents of the global names
		if global.BayName != "Bay"			text[i] = string_replace_all(text[i], "Bay", string(global.BayName) );
		if global.EeveeName != "Eevee"		text[i] = string_replace_all(text[i], "Eevee", string(global.EeveeName) );
		if global.WillowName != "Willow"	text[i] = string_replace_all(text[i], "Willow", string(global.WillowName) );
		if global.WillowName != "Reed"		text[i] = string_replace_all(text[i], "Reed", string(global.ReedName) );
		if global.OakName != "Oak"			text[i] = string_replace_all(text[i], "Oak", string(global.OakName) );
		if global.DamienName != "Damien"	text[i] = string_replace_all(text[i], "Damien", string(global.DamienName) );
		if global.AngelicaName!="Angelica"	text[i] = string_replace_all(text[i], "Angelica", string(global.AngelicaName) );

		var count = 0;
		//loop through the characters
		var char = string_char_at(text[i], count);
		while char != "" {
			var str = string_copy(text[i], 1, count);
			var str_width = string_width(str);

			if ( char == " " ) last_space = count;

			//check the width
			if str_width > width {
				text[i] = string_delete(text[i], last_space, 1);

				text[i] = string_insert("\n", text[i], last_space);
			}
            count++
            char = string_char_at(text[i], count);
        }
    }
    
}