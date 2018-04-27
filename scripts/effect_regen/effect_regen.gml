// Name: Regen
// Description: Regenerates morphs health while in effect
/// regen(inhealth, maxhealth)
/// @desc regen(inhealth, maxhealth)
/// @param inhealth the current of the morph
/// @param maxhealth the max health of effected morph
/// @return new health of morph

if ((argument0 + .1 * argument1) > argument1)
	return argument1;
else
	return (argument0 + .1 * argument1);