// Name: Poison
// Description: Lowers morphs health while in effect
/// poison(inhealth, maxhealth)
/// @desc poison(inhealth, maxhealth)
/// @param inhealth the current of the morph
/// @param maxhealth the max health of effected morph
/// @return new health of morph

if ((argument0 - .2 * argument1) < 0)
	return 0;
else
	return (argument0 - .2 * argument1);