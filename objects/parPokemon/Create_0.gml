/// @description Insert description here
// You can write your code in this editor

thumbnail = spr_nonmorph_eevee;
sprite = spr_nonmorph_eevee;
name = "Eevee";
type1 = pokemon_type.normal;
type2 = noone;
flavor_text = "A cute puppy pokemon with an unstable genetic structure that allows it to evolve in many ways depending on its environment."
flavor_name = "Evolution Pokemon";
flavor_height = 0.3;
flavor_weight = 6.5;
current_level = irandom_range(global.min_level, global.max_level);
base_hp = 55;
base_attack = 55;
base_defense = 50;
base_specatk = 45;
base_specdef = 65;
base_speed = 55;
var base_mod = 2;
var level_mod = 20;
ev_hp =				irandom_range(8, 12) / 10;
ev_attack =			irandom_range(8, 12) / 10;
ev_defense =		irandom_range(8, 12) / 10;
ev_specatk =		irandom_range(8, 12) / 10;
ev_specdef =		irandom_range(8, 12) / 10;
ev_speed =			irandom_range(8, 12) / 10;
max_hp =			base_hp/base_mod+base_hp/level_mod*ev_hp*current_level;
max_attack=			base_attack/base_mod + base_attack/level_mod * ev_attack * current_level;
max_defense=		base_defense/base_mod + base_defense/level_mod * ev_defense * current_level;
max_specatk=		base_specatk/base_mod + base_specatk/level_mod * ev_specatk * current_level;
max_specdef=		base_specdef/base_mod + base_specdef/level_mod * ev_specdef * current_level;
max_speed=			base_speed/base_mod + base_speed/level_mod * ev_speed * current_level;
current_hp = max_hp;
current_attack = max_attack;
current_defense = max_defense;
current_specatk = max_specatk;
current_specdef = max_specdef;
current_speed = max_speed;
catchrate = 45;
caught_place = string(room_get_name(room));
caught_time = date_current_datetime();
caught_level = current_level;
caught_trainer = noone;


//----------------------GENERATE MOVES LIST-------------------------
move_list = ds_grid_create(2, 50);
ds_grid_clear(move_list, 0);
var iter = 0;
add_move(move_list, iter, "tackle", 0)
//show_message(move_list[# 0, 0]);

moves[3] = "tackle";