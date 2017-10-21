/// @desc Initialize game records and macros
randomize();
global.min_level = 1;
global.max_level = 3;

//initialize game options
sound = 100;
music = 100;
text_speed = 30/room_speed;
difficulty = 1;

//initialize game control variables
controlTimer = 0;
run_state = false;
right_key = false;
left_key = false;
up_key = false;
down_key = false;
run_key = false;
interact_key = false;
question_key = false;
menu_key = false;
any_key = false;
winmouse_x = 0;
winmouse_y = 0;
mouse_x1 = 0;
mouse_y1 = 0;
mouse_hold = false;
mouse_hover = noone;

//initialize GUI buttons
talkButton = instance_nearest(0, 0, oTalkButton);
askButton = instance_nearest(0, 0, oAskButton);
runButton = instance_nearest(0, 0, oRunButton);
mountButton = noone;
menuButton = instance_nearest(0, 0, oMenuButton);
dPad = instance_nearest(0, 0, oDPad);
lights = instance_nearest(0, 0, oGameData);


//music control variables
music = mus_pallet;
intro = mus_pallet_intro;
music_pause = true;

//resize the screen if necessary
var screen_height = display_get_height();
if screen_height != 900 {	//run resize code
	//screen_height -= 80;
	global.win_scale = screen_height/900;	
} else global.win_scale = 1;
window_set_size(global.win_scale*1336, screen_height);
display_set_gui_maximise(global.win_scale, global.win_scale, 0, 0);
view_visible[0]=true;
view_xport[0]=400*global.win_scale;
view_yport[0]=156*global.win_scale;
view_wport[0]=820*global.win_scale;
view_hport[0]=480*global.win_scale;