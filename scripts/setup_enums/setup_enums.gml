
//define macros
#macro GRID_SIZE 32
#macro GAME_SPEED game_get_speed(gamespeed_fps)

enum sexes {
	female,
	male
}

enum weather {
	sunny,
	cloudy,
	rainy,
	stormy,
	snowy,
	windy,
	evening,
	night,
	morning,
	dark,
	foggy,
	hot,
	ash,
	sandstorm
}

enum terrain {
	beach,
	pool,
	building,
	city,
	cave,
	cave2,
	cave3,
	computer,
	desert,
	dimension,
	field,
	forest,
	forest_creepy,
	forest_dark,
	forest2,
	snowy,
	swamp,
	swamp_water,
	swamp2,
	underwater,
	volcano,
	volcano2,
	water,
}

enum animate_type {
	once,
	loop,
	yoyo,
}

enum directions {
	right,
	up,
	left,
	down,
}

enum battle_poses {
	back,
	front,
	horny,
}

enum events {
	talk = 0,
	format_text = 1,
}

enum letter_buttons {
	talk,
	ask,
	run,
	mount,
	menu,
}

enum collision_types {
	empty,
	solid,
	water,
	grass,
	ice
}

enum pokemon_type {
    normal,
    flying,
    electric,
    ground,
    grass,
    fire,
    water,
    bug,
	poison,
    rock,
    fighting,
    psychic,
    ghost,
    dark,
    dragon,
    ice,
    fairy
}

enum dex_id {
	Missingno	=0,
	Bulbasaur	=1,
	Ivysaur		=2,
	Venusaur	=3,
	Charmander	=4,
	Charmeleon	=5,
	Charizard	=6,
	Squirtle	=7,
	Wartortle	=8,
	Blastoise	=9,
	Caterpie	=10,
	Metapod		=11,
	Butterfree	=12,
	Weedle		=13,
	Kakuna		=14,
	Beedrill	=15,
	Pidgey		=16,
	Pidgeotto	=17,
	Pidgeot		=18,
	Rattata		=19,
	Raticate	=20,
	Spearow		=21,
	Fearow		=22,
	Ekans		=23,
	Arbok		=24,
	Pikachu		=25,
	Raichu		=26,
	Sandshrew	=27,
	Sandslash	=28,
	Nidoran_f	=29,
	Nidorina	=30,
	Nidoqueen	=31,
	Nidoran_m	=32,
	Nidorino	=33,
	Nidoking	=34,
	Clefairy	=35,
	Clefable	=36,
	Vulpix		=37,
	Ninetails	=38,
	Jigglypuff	=39,
	Wigglytuff	=40,
	Zubat		=41,
	Golbat		=42,
	Oddish		=43,
	Gloom		=44,
	Vileplume	=45,
	Paras		=46,
	Parasect	=47,
	Venonat		=48,
	Venomoth	=49,
	Diglett		=50,
	Dugtrio		=51,
	Meowth		=52,
	Persian		=53,
	Psyduck		=54,
	Golduck		=55,
	Mankey		=56,
	Primeape	=57,
	Growlithe	=58,
	Arcanine	=59,
	Poliwag		=60,
	Poliwhirl	=61,
	Poliwrath	=62,
	Abra		=63,
	Kadabra		=64,
	Alakazam	=65,
	Machop		=66,
	Machoke		=67,
	Machamp		=68,
	Bellsprout	=69,
	Weepinbell	=70,
	Victreebel	=71,
	Tentacool	=72,
	Tentacruel	=73,
	Geodude		=74,
	Graveler	=75,
	Golem		=76,
	Ponyta		=77,
	Rapidash	=78,
	Slowpoke	=79,
	Slowbro		=80,
	Magnemite	=81,
	Magneton	=82,
	Farfetchd	=83,
	Doduo		=84,
	Dodrio		=85,
	Seel		=86,
	Dewgong		=87,
	Grimer		=88,
	Muk			=89,
	Shellder	=90,
	Cloyster	=91,
	Ghastly		=92,
	Haunter		=93,
	Gengar		=94,
	Onix		=95,
	Drowsee		=96,
	Hypno		=97,
	Krabby		=98,
	Kingler		=99,
	Voltorb		=100,
	Electrode	=101,
	Exeggcute	=102,
	Exeggutor	=103,
	Cubone		=104,
	Marowak		=105,
	Hitmonlee	=106,
	Hitmonchan	=107,
	Lickitung	=108,
	Koffing		=109,
	Weezing		=110,
	Rhyhorn		=111,
	Rhydon		=112,
	Chansey		=113,
	Tangela		=114,
	Kangaskhan	=115,
	Horsea		=116,
	Seadra		=117,
	Goldeen		=118,
	Seaking		=119,
	Staryu		=120,
	Starmie		=121,
	MrMime		=122,
	Scyther		=123,
	Jynx		=124,
	Electabuzz	=125,
	Magmar		=126,
	Pinsir		=127,
	Tauros		=128,
	Magikarp	=129,
	Gyarados	=130,
	Lapras		=131,
	Ditto		=132,
	Eevee		=133,
	Vaporeon	=134,
	Jolteon		=135,
	Flareon		=136,
	Porygon		=137,
	Omanyte		=138,
	Omastar		=139,
	Kabuto		=140,
	Kabutops	=141,
	Aerodactyl	=142,
	Snorlax		=143,
	Articuno	=144,
	Zapdos		=145,
	Moltres		=146,
	Dratini		=147,
	Dragonair	=148,
	Dragonite	=149,
	Mewtwo		=150,
	Mew			=151,
	Eevee_nm	=152,
	Pidgey_nm	=153,
	Spearow_nm	=154,
	Rattata_nm	=155,
	done
}

enum stats_breed {
	ID,
	name,
	species,
	flavor_text,
	height,
	weight,
	sprite,
	picture,
	sex,
	type1,
	type2,
	hit_points,
	attack,
	defense,
	special_attack,
	special_defense,
	spd,
	catch_rate,
	done
}

enum move_stats {
	name,
	sprite_ally,
	sprite_enemy,
	sound,
	pwr,
	type,
	special,
	accuracy,
	effect_chance,
	effect,
	description,
	done
}

enum move_effects {
	poison,
	burn,
	sleep,
	paralyze,
	frozen,
	flinch,
	confusion,
	infatuation,
	bound,
	identified,
	leech_seed,
	done
}

enum moves {
	tackle,
	scratch,
	done
}

enum items {
	pokeball,
	great_ball,
	ultra_ball,
	pokenip,
	done
}

enum item_stats {
	name,
	flavor_text,
	value,
	sprite,
	done
}