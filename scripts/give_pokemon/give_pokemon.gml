/// @function give_pokemon();
/// @description Gives the player a new pokemon.
/// @arg pokemon id


//find an empty space and put the new pokemon in it
audio_play_sound(snd_get_pokemon, 3, false);
if      oPlayer.pokemon[0] == noone	oPlayer.pokemon[0] = argument0;
else if oPlayer.pokemon[1] == noone	oPlayer.pokemon[1] = argument0;
else if oPlayer.pokemon[2] == noone	oPlayer.pokemon[2] = argument0;
else if oPlayer.pokemon[3] == noone	oPlayer.pokemon[3] = argument0;
else if oPlayer.pokemon[4] == noone	oPlayer.pokemon[4] = argument0;
else if oPlayer.pokemon[5] == noone	oPlayer.pokemon[5] = argument0;
else {	//if the party is full, add the new pokemon to the storage array
	
}