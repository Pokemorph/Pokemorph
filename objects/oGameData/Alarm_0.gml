/// @desc initialize game data in stages
// You can write your code in this editor

switch (run_state) {
	case 0:
		init_pokemon(dex_id.Bulbasaur, "Bulbasaur", "Seed Pokemon", 0.71, 6.9, spr_eevee_base, battle_bulbasaur, true, pokemon_type.grass, pokemon_type.poison, 45, 49, 49, 65, 65, 45, 45, "Sunlight is stored in the seed on its back. When its stores are full the excess energy is processed as an aphrodisiac, forcing Bulbasaur to burn it off through ejaculation.");
		init_pokemon(dex_id.Ivysaur, "Ivysaur", "Seed Pokemon", 0.99, 13, spr_eevee_base, battle_ivysaur, true, pokemon_type.grass, pokemon_type.poison, 60, 62, 63, 80, 80, 60, 45, "Once the seed blossoms the weight forces Ivysaur on all fours, despite its strengthened leg muscles. Being forced into this position only heightens it's desires when its energy stores are overflowing.");
		init_pokemon(dex_id.Venusaur, "Venusaur", "Seed Pokemon", 2.01, 100, spr_eevee_base, battle_venusaur, true, pokemon_type.grass, pokemon_type.poison, 80, 82, 83, 100, 100, 80, 45, "When Venusaur's flower is in full bloom it becomes very heavy and vibrant, and produces a nearly intoxicating aroma. Because of this, Venusaur is in a constant state of arousal. When its energy stores are overflowing, Venusaur will overpower anything near it for satisfaction.");
		init_pokemon(dex_id.Eevee_nm, "Eevee", "Evolution Pokemon", 0.3, 6.5, spr_eevee_base, battle_eevee_nm, true, pokemon_type.normal, noone, 55, 55, 50, 45, 65, 55, 45, "An extremely rare pokemon that may evolve in a number of different ways depending on stimuli.");
		
		run_state = 20;
		alarm[0] = 1;
		break;
	case 20: //start the moves here. This leaves me space for extra cases to initialize new pokemon
		init_move(moves.tackle, "Tackle", noone, noone, noone, 40, pokemon_type.normal, false, 100, 0, noone, "A full body glomp, indicative of an overeager, attention-seeking pokemon.");
		init_move(moves.scratch, "Scratch", noone, noone, noone, 35, pokemon_type.normal, false, 100, 0, noone, "A feisty move, often performed in self defense.");
		run_state = 25;
		alarm[0] = 1;
		break;
		
	case 25:
		ds_grid_set(global.moveLists, 0, dex_id.Bulbasaur, moves.tackle);
		ds_grid_set(global.moveLists, 0, dex_id.Ivysaur, moves.tackle);
		ds_grid_set(global.moveLists, 0, dex_id.Venusaur, moves.tackle);
		ds_grid_set(global.moveLists, 0, dex_id.Eevee_nm, moves.tackle);
}