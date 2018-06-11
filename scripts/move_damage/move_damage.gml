///@function move_damage()
///@description calculates damage from moves
///@argument user_id
///@argument move_id
///@argument target_id
///@argument crit
//in order to perform necessary calculations in this phase, get vital data
var user_id = argument0, move_id = argument1, target_id = argument2;
if argument3	var crit = 1.5;		//if move is determined to be a crit, increase damage
else	var crit = 1;
var pwr = ds_grid_get(global.moves, move_stats.pwr, move_id);
var special = ds_grid_get(global.moves, move_stats.special, move_id);


//check for special to determine which stats will affect attack
if special { 
	var mult = get_stat_modifier(round(user_id.spatk_lvl));
	var stat = user_id.spatk_cur;
} else { 
	var mult = get_stat_modifier(round(user_id.atk_lvl));
	var stat = user_id.atk_cur;
} var atk = stat*mult;

//repeat this for the defense
if special { 
	var mult = get_stat_modifier(round(user_id.spdef_lvl));
	var stat = user_id.spdef_cur;
} else { 
	var mult = get_stat_modifier(round(user_id.def_lvl));
	var stat = user_id.def_cur;
} var def = stat*mult;


//find the values of the power modifier	
var typing = 1; var stab = 1; var rand = random_range(0.8, 1);
var pwr_mod = typing * stab * rand * crit;

//once we get the level, we have everything we need to return the damage calculation
var lvl = user_id.current_level;
var dmg = (((pwr/10 * atk / def) * lvl/4) + 5) * pwr_mod;
	
return dmg;

/*	POKEMON DAMAGE CALCULATION
(((2 x lvl / 5 + 2) * move_power * attack / defense) / 50 + 2) * (targets*weather*badge*critical*random*STAB*type*burn*other)
this all seems rather more complicated than necessary, so let's look into simplifying
(lvl/2 + 2) * move_power * attack*atk_mod / defense*def_mod
my damage calculation formula:
((move_power/10 * attack / defense) * level/4) + 5

Original damage mod components:
targets = 0.75 if move targets multiple enemies
weather = 1.5 if using fire during bright sun or water during rain, or 0.5 if reversed
badge = useless, ignore
critical = 1.5 and ignore defense boosts or attack reduction if a crit is rolled
random = a random value between 0.85 and 1
STAB = 1.5 if used move type matches the pokemon's type
type = movetype vs defender types calculation, from 0 to 1/4 damage to 4x damage
burn = 0.5 if move is physical and target is burned and does not have the ability guts
other = specific values tailored to specific move interactions, such as x2 from using earthquake during dig
Okay, so what should still be included here? I mean, the mod can just be set to one for now, but then I can
set up typing, stab, and random