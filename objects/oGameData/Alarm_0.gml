/// @desc initialize game data in stages
// You can write your code in this editor

switch(run_state)	{
	case 0:
		eevee = [spr_nonmorph_eevee, "Puppy", "Normal", ""];
		break;
	default:
		break;
}


global.playerTeam[6] = instance_create_layer(0, 0, layer, parPokemon);