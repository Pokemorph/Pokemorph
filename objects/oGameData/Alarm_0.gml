/// @desc initialize game data in stages
// You can write your code in this editor

switch (run_state) {
	case 0:
		var poke = dex_id.Bulbasaur;
		global.breedData[# poke, stats_breed.name] = "Bulbasaur";
		global.breedData[# poke, stats_breed.species] = "Seed Pokemon";
		global.breedData[# poke, stats_breed.flavor_text] = "Sunlight is stored in the seed on its back. When its stores are full the excess energy is processed as an aphrodisiac, forcing Bulbasaur to burn it off through ejaculation.";
		global.breedData[# poke, stats_breed.height] = 0.71;
		global.breedData[# poke, stats_breed.weight] = 6.9;
		global.breedData[# poke, stats_breed.sprite] = battle_bulbasaur;
		global.breedData[# poke, stats_breed.type1] = pokemon_type.grass;
		global.breedData[# poke, stats_breed.type2] = pokemon_type.poison;
		global.breedData[# poke, stats_breed.hit_points] = 45;
		global.breedData[# poke, stats_breed.attack] = 49;
		global.breedData[# poke, stats_breed.defense] = 49;
		global.breedData[# poke, stats_breed.special_attack] = 65;
		global.breedData[# poke, stats_breed.special_defense] = 65;
		global.breedData[# poke, stats_breed.spd] = 45;
		global.breedData[# poke, stats_breed.catch_rate] = 45;

		poke = dex_id.Ivysaur;
		global.breedData[# poke, stats_breed.name] = "Ivysaur";
		global.breedData[# poke, stats_breed.species] = "Seed Pokemon";
		global.breedData[# poke, stats_breed.flavor_text] = "Once the seed blossoms the weight forces Ivysaur on all fours, despite its strengthened leg muscles. Being forced into this position only heightens it's desires when its energy stores are overflowing.";
		global.breedData[# poke, stats_breed.height] = 0.99;
		global.breedData[# poke, stats_breed.weight] = 13;
		global.breedData[# poke, stats_breed.sprite] = battle_ivysaur;
		global.breedData[# poke, stats_breed.type1] = pokemon_type.grass;
		global.breedData[# poke, stats_breed.type2] = pokemon_type.poison;
		global.breedData[# poke, stats_breed.hit_points] = 60;
		global.breedData[# poke, stats_breed.attack] = 62;
		global.breedData[# poke, stats_breed.defense] = 63;
		global.breedData[# poke, stats_breed.special_attack] = 80;
		global.breedData[# poke, stats_breed.special_defense] = 80;
		global.breedData[# poke, stats_breed.spd] = 60;
		global.breedData[# poke, stats_breed.catch_rate] = 45;

		poke = dex_id.Venusaur;
		global.breedData[# poke, stats_breed.name] = "Venusaur";
		global.breedData[# poke, stats_breed.species] = "Seed Pokemon";
		global.breedData[# poke, stats_breed.flavor_text] = "When Venusaur's flower is in full bloom it becomes very heavy and vibrant, and produces a nearly intoxicating aroma. Because of this, Venusaur is in a constant state of arousal. When its energy stores are overflowing, Venusaur will overpower anything near it for satisfaction."
		global.breedData[# poke, stats_breed.height] = 2.01;
		global.breedData[# poke, stats_breed.weight] = 100;
		global.breedData[# poke, stats_breed.sprite] = battle_venusaur;
		global.breedData[# poke, stats_breed.type1] = pokemon_type.grass;
		global.breedData[# poke, stats_breed.type2] = pokemon_type.poison;
		global.breedData[# poke, stats_breed.hit_points] = 80;
		global.breedData[# poke, stats_breed.attack] = 82;
		global.breedData[# poke, stats_breed.defense] = 83;
		global.breedData[# poke, stats_breed.special_attack] = 100;
		global.breedData[# poke, stats_breed.special_defense] = 100;
		global.breedData[# poke, stats_breed.spd] = 80;
		global.breedData[# poke, stats_breed.catch_rate] = 45;
	
		run_state = 20;
		alarm[0] = 1;
		break;
	case 20: //start the moves here. This leaves me space for extra cases to initialize new pokemon
		var iter = 0;
		global.moves[# iter, move_stats.name] = "Tackle";
		global.moves[# iter, move_stats.sprite_ally] = noone;
		global.moves[# iter, move_stats.sprite_enemy] = noone;
		global.moves[# iter, move_stats.sound] = noone;
		global.moves[# iter, move_stats.pwr] = 40;
		global.moves[# iter, move_stats.type] = pokemon_type.normal;
		global.moves[# iter, move_stats.special] = false;
		global.moves[# iter, move_stats.accuracy] = 100;
		global.moves[# iter, move_stats.effect_chance] = 0;
		global.moves[# iter, move_stats.effect] = noone;
		global.moves[# iter, move_stats.description] = "A full body glomp, indicative of an overeager, attention-seeking pokemon.";
		break;
		
	case 25:
		var iter = dex_id.Bulbasaur;
		global.moveLists[# iter, 0] = moves.tackle;
}