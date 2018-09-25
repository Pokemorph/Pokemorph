///@description initialize
// This object will hold all data necessary for an AI-controlled slot in battle;
// trainer info, pokemon team, and an AI script for choosing its actions in combat

trainer_name = "Deadman";
trainer_pic = battle_dedde_man;
ai_script = scr_battleAI_basic;
stats = noone;
is_enemy = true;
battle_slot = 0;
pos_x = [0, 200, 400, 60, 260, 460];
pos_y = [76, 0];
stats_x = [];
stats_y = [];
image_speed = 0;

pokemon = [];
active_pokemon = noone;
for ( var i = 5; i >= 0; i--) {
	pokemon[i] = noone;
}
pose = battle_poses.front;