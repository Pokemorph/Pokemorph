/// @desc initialize the generic pokemon object
// This create event reads from global.newLevel and global.newPokemon as constructor arguments

ev_hp = irandom_range(8, 12) / 10;
ev_attack = irandom_range(8, 12) / 10;
ev_defense = irandom_range(8, 12) / 10;
ev_specatk = irandom_range(8, 12) / 10;
ev_specdef = irandom_range(8, 12) / 10;
ev_speed = irandom_range(8, 12) / 10;
caught_place = string(room_get_name(room));
caught_time = date_current_datetime();
caught_level = global.newLevel;
caught_trainer = noone;
breed_ref = global.newPokemon;
nickname = global.breedData[# stats_breed.name, breed_ref];

//base racial statistics
var base_hp = ds_grid_get(global.breedData, stats_breed.hit_points, breed_ref);
var base_atk = ds_grid_get(global.breedData, stats_breed.attack, breed_ref);
var base_def = ds_grid_get(global.breedData, stats_breed.defense, breed_ref);
var base_spatk = ds_grid_get(global.breedData, stats_breed.special_attack, breed_ref);
var base_spdef = ds_grid_get(global.breedData, stats_breed.special_defense, breed_ref);
var base_spd = ds_grid_get(global.breedData, stats_breed.spd, breed_ref);
sprite_index = ds_grid_get(global.breedData, stats_breed.sprite, breed_ref);

//starting instance statistics
current_level = caught_level;
current_xp = irandom_range(0, 100);
hp_max = (base_hp/2 + (base_hp/20 * current_level)) * ev_hp + current_level;
hp_cur = hp_max;
atk_cur = (base_atk/5 + (base_atk/20 * current_level)) * ev_attack;
def_cur = (base_def/5 + (base_def/20 * current_level)) * ev_defense;
spd_cur = (base_spd/5 + (base_spd/20 * current_level)) * ev_speed;
spatk_cur = (base_spatk/5 + (base_spatk/20 * current_level)) * ev_specatk;
spdef_cur = (base_spdef/5 + (base_spdef/20 * current_level)) * ev_specdef;

//permanent status
status = -1;

//stat mods act as multipliers for permanent stats during battle
atk_mod = 1;
def_mod = 1;
spd_mod = 1;
spatk_mod = 1;
spdef_mod = 1;

/*
	MOVE ACQUISITION SECTION
*/
//acquire all moves available for selection
var moves_learned = ds_stack_create();
for (var i = 0; i <= current_level; i++) {
	var m = ds_grid_get(global.moveLists, i, breed_ref);
	if m >= 0 {
		ds_stack_push(moves_learned, m);
	}
}

//at this point, just check if there are enough values and pop them off. If nothing is available, -1
var size = ds_stack_size(moves_learned);
if size >= 4	moves_4 = ds_stack_pop(moves_learned); else	moves_4 = -1;
if size >= 3	moves_3 = ds_stack_pop(moves_learned); else	moves_3 = -1;
if size >= 2	moves_2 = ds_stack_pop(moves_learned); else	moves_2 = -1;
if size >= 1	moves_1 = ds_stack_pop(moves_learned); else	moves_1 = -1;
ds_stack_destroy(moves_learned);