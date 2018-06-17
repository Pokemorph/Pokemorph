/// @desc collision event
// when the player object finds itself on top of us after a move, it triggers this sleep code

audio_play_sound(snd_heal, 1, false);

//check for player pokemon and, if we find them, heal them
if instance_exists(oPlayer.pokemon[0]) with oPlayer.pokemon[0] hp_cur = hp_max;
if instance_exists(oPlayer.pokemon[1]) with oPlayer.pokemon[1] hp_cur = hp_max;
if instance_exists(oPlayer.pokemon[2]) with oPlayer.pokemon[2] hp_cur = hp_max;
if instance_exists(oPlayer.pokemon[3]) with oPlayer.pokemon[3] hp_cur = hp_max;
if instance_exists(oPlayer.pokemon[4]) with oPlayer.pokemon[4] hp_cur = hp_max;
if instance_exists(oPlayer.pokemon[5]) with oPlayer.pokemon[5] hp_cur = hp_max;