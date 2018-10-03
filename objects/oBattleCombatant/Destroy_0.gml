/// @desc cleanup attached data
// You can write your code in this editor
for (var j = 0; j < array_length_1d(pokemon); j++) { //for each pokemon on the combatant's team
	if pokemon[j] != noone and pokemon[j] != oPlayer.pokemon[j] { //if it's not a player pokemon, destroy it
		instance_destroy(pokemon[j]);
	}
}