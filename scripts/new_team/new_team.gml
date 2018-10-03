///@function new_combatant()
///@description Initializes a new pokemon combatant with a team, trainer, and ai
///@argument trainer_pic
///@argument trainer_name
///@argument ai_script
///@argument pokemon_1
///@argument ...

var n = instance_create_depth(-1000, -1000, 0, oBattleCombatant);

with n {
	trainer_pic = argument[0];
	trainer_name = argument[1];
	ai_script = argument[2];
	for ( var i = 0; i < argument_count-3; i++) {
		pokemon[i] = argument[i+3];
	}
	for ( var i = 0; i < array_length_1d(pokemon); i++ ) {
		if instance_exists(pokemon[i]) and pokemon[i].hp_cur > 0 {
			active_pokemon = pokemon[i]; break;
			sprite_index = trainer_pic;
		}
	}
	if sprite_exists(trainer_pic) 	sprite_index = trainer_pic;
}

return n;