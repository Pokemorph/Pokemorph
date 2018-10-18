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
    
	//loop through options if they exist
	var array_size = array_length_1d(choices);
	for(var i = 0; i < array_size; i++) {
		//find and replace any instances of character names with the contents of the global names
		if global.BayName != "Bay"			choices[i] = string_replace_all(choices[i], "Bay", string(global.BayName) );
		if global.EeveeName != "Eevee"		choices[i] = string_replace_all(choices[i], "Eevee", string(global.EeveeName) );
		if global.WillowName != "Willow"	choices[i] = string_replace_all(choices[i], "Willow", string(global.WillowName) );
		if global.WillowName != "Reed"		choices[i] = string_replace_all(choices[i], "Reed", string(global.ReedName) );
		if global.OakName != "Oak"			choices[i] = string_replace_all(choices[i], "Oak", string(global.OakName) );
		if global.DamienName != "Damien"	choices[i] = string_replace_all(choices[i], "Damien", string(global.DamienName) );
		if global.AngelicaName!="Angelica"	choices[i] = string_replace_all(choices[i], "Angelica", string(global.AngelicaName) );

		var count = 0;
		//loop through the characters
		var char = string_char_at(choices[i], count);
		while char != "" {
			var str = string_copy(choices[i], 1, count);
			var str_width = string_width(str);

			if ( char == " " ) last_space = count;

			//check the width
			if str_width > width {
				choices[i] = string_delete(choices[i], last_space, 1);

				choices[i] = string_insert("\n", choices[i], last_space);
			}
            count++
            char = string_char_at(choices[i], count);
        }
    }
	
	//and after all text corrections, if options exist, create the menu
	if array_length_1d(choices) > 0 {
		var xx = x+sprite_width-168-24;
		var yy = y-4;
		var ysep = 16;
		var count = array_length_1d(choices)+2;
		
		//loop through all options, adding a top and bottom to the menu
		for ( var i = 0; i < count; i++ ) {
			menu_array[i] = instance_create_depth(xx, yy-(count-i)*ysep, depth, oDialogChoice);
			
			//now, if menu piece is the top or bottom, set sprite. Else, set text
			if i == 0				menu_array[i].image_index = 0;
			else if i == count-1	menu_array[i].image_index = 2;
			else					menu_array[i].text = choices[i-1];
		}
	}
}