/// @desc initialize the generic pokemon object
// This create event covers only the most generic of items
// the remainder of initialization needs to be fed in from a scripted constructor

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
nickname = global.breedData[# breed_ref, stats_breed.name];

var base_hp = ds_grid_get(global.breedData, breed_ref, stats_breed.hit_points);;
var base_atk = ds_grid_get(global.breedData, breed_ref, stats_breed.attack);
var base_def = ds_grid_get(global.breedData, breed_ref, stats_breed.defense);
var base_spatk = ds_grid_get(global.breedData, breed_ref, stats_breed.special_attack);
var base_spdef = ds_grid_get(global.breedData, breed_ref, stats_breed.special_defense);
var base_spd = ds_grid_get(global.breedData, breed_ref, stats_breed.spd);
sprite_index = ds_grid_get(global.breedData, breed_ref, stats_breed.sprite);

current_level = global.newLevel;
current_xp = irandom_range(0, 10);
hp_max = (base_hp/2 + (base_hp/20 * current_level)) * ev_hp + current_level;
hp_cur = hp_max;
atk_cur = (base_atk/5 + (base_atk/20 * current_level)) * ev_attack;
def_cur = (base_def/5 + (base_def/20 * current_level)) * ev_defense;
spd_cur = (base_spd/5 + (base_spd/20 * current_level)) * ev_speed;
spatk_cur = (base_spatk/5 + (base_spatk/20 * current_level)) * ev_specatk;
spdef_cur = (base_spdef/5 + (base_spdef/20 * current_level)) * ev_specdef;
status = -1;

moves_1 = -1;
moves_2 = -1;
moves_3 = -1;
moves_4 = -1;

atk_mod = 1;
def_mod = 1;
spd_mod = 1;
spatk_mod = 1;
spdef_mod = 1;