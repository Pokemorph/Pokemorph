/// @function give_pokemon();
/// @description Gives the player a new pokemon.
/// @arg pokemon id


//find an empty space and put the new pokemon in it
if      oPlayer.pokemon1 == noone	oPlayer.pokemon1 = argument0;
else if oPlayer.pokemon2 == noone	oPlayer.pokemon2 = argument0;
else if oPlayer.pokemon3 == noone	oPlayer.pokemon3 = argument0;
else if oPlayer.pokemon4 == noone	oPlayer.pokemon4 = argument0;
else if oPlayer.pokemon5 == noone	oPlayer.pokemon5 = argument0;
else if oPlayer.pokemon6 == noone	oPlayer.pokemon6 = argument0;
else {	//if the party is full, add the new pokemon to the storage array
	
}