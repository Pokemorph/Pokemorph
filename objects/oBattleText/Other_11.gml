/// @desc format text
// this event will reformat the full text in order to tell gamemaker when to break a line

if (text != undefined) {

	//set font
	draw_set_font(fnt_dialog);
	
	//get page count
	var array_size = array_length_1d(text);
	var last_space = 0;
	
	//re-set the width depending on whether or not the battle menu exists
	if !instance_exists(oBattleMenu)	width = sprite_width - (margin*2);
	else						width = sprite_width - 324 - (margin*2);
    
	//loop through pages
	for(var i = 0; i < array_size; i++) {
		//first find and replace any instances of placeholder strings with appropriate strings
		/*var pmon = parent.pmon; var emon = parent.emon;
		var pname = pmon.nickname; var ename = emon.nickname;
		
		text[i] = string_replace_all(text[i], "pmon", string(pname) );
		text[i] = string_replace_all(text[i], "emon", string(ename) );
		text[i] = string_replace_all(text[i], "ptrain", string(parent.player_trainer) );
		text[i] = string_replace_all(text[i], "etrain", string(parent.enemy_trainer) );
		*/
		
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