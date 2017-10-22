// Name: paralyse
// Description: Regenerates morphs health while in effect
/// paralyze()
/// @desciscription paralyze()
/// @return 1 if unable to move, 0 if able to move

if (random(1)<.25)
	return 1; //pokemon is paralysed and unable to move
else
	return 0; //pokemons moves
