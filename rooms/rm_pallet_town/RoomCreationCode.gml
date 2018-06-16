//change music
set_music("mus_pallet");
if !instance_exists(oHUD)	instance_create_depth(0, 0, 0, oHUD);
global.roomName = "Pallet";

//reset and set up the wild list
global.wildList = 0; global.wildList = [];
global.wildList[0] = dex_id.Bulbasaur; global.wildList[1] = dex_id.Bulbasaur;
global.wildList[2] = dex_id.Eevee; global.wildList[3] = dex_id.Ivysaur;
global.min_level = 2; global.max_level = 5;