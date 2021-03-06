/// @desc Initialize game controller
randomize();
global.winmouse_x = 0;
global.winmouse_y = 0;

//initialize game options
volume_master = 1;
volume_sound = 1;
volume_music = 1;
text_speed = 30/room_speed;
difficulty = 1;
audio_group_set_gain(audiogroup_music, volume_music, 0);
audio_group_set_gain(audiogroup_default, volume_sound, 0);
audio_group_load(audiogroup_music);

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
music_name = "snd_silence";
music = snd_silence;
intro = snd_silence;
last_song = "snd_silence";

//weather variables
global.weather = weather.sunny;

//inialize mouse cursor
cursor_sprite = cursor_ball;

//resize the screen if necessary, then prepare to center it
var screen_height = window_get_height();
if screen_height != 900 {	//if auto-sized screen is smaller than intended, run resize code
	//screen_height -= 80;
	global.win_scale = screen_height/900;
} else global.win_scale = 1;
window_set_size(global.win_scale*1336, screen_height);
camera_set_view_size(view_camera[0], 1336, 900);
display_set_gui_maximise(global.win_scale, global.win_scale, 0, 0);
alarm[0] = 1; //set an alarm to center window, since this needs a frame to work properly
