/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 414C610F
/// @DnDArgument : "code" "/// @desc Get Player Input$(13_10)//placeholder title$(13_10)$(13_10)"
/// @desc Get Player Input
//placeholder title

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 48DD5069
/// @DnDArgument : "code" "/// @description get mouse inputs$(13_10)global.winmouse_x = window_mouse_get_x()/global.win_scale;$(13_10)global.winmouse_y = window_mouse_get_y()/global.win_scale;$(13_10)if mouse_check_button_pressed(mb_left) {$(13_10)	mouse_x1 = mouse_x;$(13_10)	mouse_y1 = mouse_y;$(13_10)	mouse_hold = true;$(13_10)} else if mouse_check_button_released(mb_left) {$(13_10)	mouse_x2 = mouse_x;$(13_10)	mouse_y2 = mouse_y;$(13_10)	mouse_hold = false;$(13_10)}$(13_10)$(13_10)with parButton {$(13_10)	if position_meeting(global.winmouse_x, global.winmouse_y, self) {$(13_10)		hover = true;$(13_10)	} else {$(13_10)		hover = false;$(13_10)		active = false;$(13_10)		click = false;$(13_10)	}$(13_10)$(13_10)	if hover {$(13_10)		if mouse_check_button(mb_left) {$(13_10)			active = true;$(13_10)			click = false;$(13_10)		}$(13_10)		if mouse_check_button_released(mb_left) {$(13_10)			active = false;$(13_10)			click = true;$(13_10)			event_user(0);$(13_10)			alarm[0] = 1;$(13_10)		}$(13_10)	}$(13_10)}"
/// @description get mouse inputs
global.winmouse_x = window_mouse_get_x()/global.win_scale;
global.winmouse_y = window_mouse_get_y()/global.win_scale;
if mouse_check_button_pressed(mb_left) {
	mouse_x1 = mouse_x;
	mouse_y1 = mouse_y;
	mouse_hold = true;
} else if mouse_check_button_released(mb_left) {
	mouse_x2 = mouse_x;
	mouse_y2 = mouse_y;
	mouse_hold = false;
}

with parButton {
	if position_meeting(global.winmouse_x, global.winmouse_y, self) {
		hover = true;
	} else {
		hover = false;
		active = false;
		click = false;
	}

	if hover {
		if mouse_check_button(mb_left) {
			active = true;
			click = false;
		}
		if mouse_check_button_released(mb_left) {
			active = false;
			click = true;
			event_user(0);
			alarm[0] = 1;
		}
	}
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 3F584E95
/// @DnDArgument : "code" "/// @description control the d-pad$(13_10)if instance_exists(dPad) with dPad {$(13_10)	if hover {$(13_10)		if global.winmouse_x <= x-17 {$(13_10)			dir = LEFT;$(13_10)			//message_box("DIR is left. Click is " + string(click))$(13_10)		} else if global.winmouse_x >= x+17 {$(13_10)			dir = RIGHT;$(13_10)			//message_box("DIR is right. Click is " + string(click))$(13_10)		} else if global.winmouse_y <= y-17 {$(13_10)			dir = UP;$(13_10)			//message_box("DIR is up. Click is " + string(click))$(13_10)		} else if global.winmouse_y >= y+17 {$(13_10)			dir = DOWN;$(13_10)			//message_box("DIR is down. Click is " + string(click))$(13_10)		} else {$(13_10)			dir = -1;$(13_10)		}$(13_10)	} else	dir = -1;$(13_10)}"
/// @description control the d-pad
if instance_exists(dPad) with dPad {
	if hover {
		if global.winmouse_x <= x-17 {
			dir = LEFT;
			//message_box("DIR is left. Click is " + string(click))
		} else if global.winmouse_x >= x+17 {
			dir = RIGHT;
			//message_box("DIR is right. Click is " + string(click))
		} else if global.winmouse_y <= y-17 {
			dir = UP;
			//message_box("DIR is up. Click is " + string(click))
		} else if global.winmouse_y >= y+17 {
			dir = DOWN;
			//message_box("DIR is down. Click is " + string(click))
		} else {
			dir = -1;
		}
	} else	dir = -1;
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2197A7CA
/// @DnDArgument : "code" "/// @desc get keyboard input$(13_10)right_key = keyboard_check(vk_right) or keyboard_check(ord("D")) or$(13_10)	(dPad != noone and mouse_hold == true and dPad.dir == RIGHT);$(13_10)left_key = keyboard_check (vk_left) or keyboard_check(ord("A"))or$(13_10)	(dPad != noone and mouse_hold == true and dPad.dir == LEFT);$(13_10)down_key = keyboard_check (vk_down) or keyboard_check(ord("S"))or$(13_10)	(dPad != noone and mouse_hold == true and dPad.dir == DOWN);$(13_10)up_key = keyboard_check (vk_up) or keyboard_check(ord("W"))or$(13_10)	(dPad != noone and mouse_hold == true and dPad.dir == UP);$(13_10)	$(13_10)//if Gamepad is conected$(13_10)if (gamepad_is_connected(0)){$(13_10)	right_key = gamepad_button_check(0, gp_padr) or $(13_10)		(gamepad_axis_value(0, gp_axislh) >= 0.4);$(13_10)	left_key = gamepad_button_check(0, gp_padl)or $(13_10)		(gamepad_axis_value(0, gp_axislh) <= -0.4);$(13_10)	down_key = gamepad_button_check(0, gp_padd)or $(13_10)		(gamepad_axis_value(0, gp_axislv) <= -0.4);$(13_10)	up_key = gamepad_button_check(0, gp_padu)or $(13_10)		(gamepad_axis_value(0, gp_axislv) >= 0.4);$(13_10)}$(13_10)$(13_10)$(13_10)$(13_10)//adjust the run state (are we running or are we not running) from key pressed$(13_10)if gamepad_is_connected(0) {$(13_10)    if ( abs(gamepad_axis_value(0, gp_axislh)) >= 0.8 ) or ( abs(gamepad_axis_value(0, gp_axislv)) >= 0.8 ) {$(13_10)        run_state = true;$(13_10)		run_key = true;$(13_10)    } else$(13_10)        run_state = false;$(13_10)		run_key = false;$(13_10)} if keyboard_check_pressed (vk_shift) {$(13_10)    run_state = !run_state;$(13_10)	run_key = true;$(13_10)} else if runButton != noone and runButton.click == true {$(13_10)    run_state = !run_state;$(13_10)	run_key = true;$(13_10)} else	run_key = false;$(13_10)$(13_10)//set the interact key$(13_10)if keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) {$(13_10)    interact_key = true;$(13_10)} else if gamepad_is_connected(0) and gamepad_button_check_pressed(0, gp_face1) {$(13_10)    interact_key = true;$(13_10)} else if talkButton != noone and talkButton.click == true {$(13_10)    interact_key = true;$(13_10)} else {$(13_10)    interact_key = false;$(13_10)}$(13_10)$(13_10)//the question key$(13_10)if keyboard_check_pressed(ord("E")) or keyboard_check_pressed(vk_control) {$(13_10)    question_key = true;$(13_10)} else if gamepad_is_connected(0) and gamepad_button_check_pressed(0, gp_face2) {$(13_10)    question_key = true;$(13_10)} else if askButton != noone and askButton.click == true {$(13_10)    question_key = true;$(13_10)} else {$(13_10)    question_key = false;$(13_10)}$(13_10)$(13_10)//the menu key$(13_10)if keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_backspace) {$(13_10)    menu_key = true;$(13_10)} else if gamepad_is_connected(0) and gamepad_button_check_pressed(0, gp_start) {$(13_10)    menu_key = true;$(13_10)} else if menuButton != noone and menuButton.click == true {$(13_10)    menu_key = true;$(13_10)} else {$(13_10)    menu_key = false;$(13_10)}"
/// @desc get keyboard input
right_key = keyboard_check(vk_right) or keyboard_check(ord("D")) or
	(dPad != noone and mouse_hold == true and dPad.dir == RIGHT);
left_key = keyboard_check (vk_left) or keyboard_check(ord("A"))or
	(dPad != noone and mouse_hold == true and dPad.dir == LEFT);
down_key = keyboard_check (vk_down) or keyboard_check(ord("S"))or
	(dPad != noone and mouse_hold == true and dPad.dir == DOWN);
up_key = keyboard_check (vk_up) or keyboard_check(ord("W"))or
	(dPad != noone and mouse_hold == true and dPad.dir == UP);
	
//if Gamepad is conected
if (gamepad_is_connected(0)){
	right_key = gamepad_button_check(0, gp_padr) or 
		(gamepad_axis_value(0, gp_axislh) >= 0.4);
	left_key = gamepad_button_check(0, gp_padl)or 
		(gamepad_axis_value(0, gp_axislh) <= -0.4);
	down_key = gamepad_button_check(0, gp_padd)or 
		(gamepad_axis_value(0, gp_axislv) <= -0.4);
	up_key = gamepad_button_check(0, gp_padu)or 
		(gamepad_axis_value(0, gp_axislv) >= 0.4);
}



//adjust the run state (are we running or are we not running) from key pressed
if gamepad_is_connected(0) {
    if ( abs(gamepad_axis_value(0, gp_axislh)) >= 0.8 ) or ( abs(gamepad_axis_value(0, gp_axislv)) >= 0.8 ) {
        run_state = true;
		run_key = true;
    } else
        run_state = false;
		run_key = false;
} if keyboard_check_pressed (vk_shift) {
    run_state = !run_state;
	run_key = true;
} else if runButton != noone and runButton.click == true {
    run_state = !run_state;
	run_key = true;
} else	run_key = false;

//set the interact key
if keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) {
    interact_key = true;
} else if gamepad_is_connected(0) and gamepad_button_check_pressed(0, gp_face1) {
    interact_key = true;
} else if talkButton != noone and talkButton.click == true {
    interact_key = true;
} else {
    interact_key = false;
}

//the question key
if keyboard_check_pressed(ord("E")) or keyboard_check_pressed(vk_control) {
    question_key = true;
} else if gamepad_is_connected(0) and gamepad_button_check_pressed(0, gp_face2) {
    question_key = true;
} else if askButton != noone and askButton.click == true {
    question_key = true;
} else {
    question_key = false;
}

//the menu key
if keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_backspace) {
    menu_key = true;
} else if gamepad_is_connected(0) and gamepad_button_check_pressed(0, gp_start) {
    menu_key = true;
} else if menuButton != noone and menuButton.click == true {
    menu_key = true;
} else {
    menu_key = false;
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 62726DFB
/// @DnDArgument : "code" "/// @desc input cleanup$(13_10)$(13_10)//if any move commands cross (up+down, right+left) set both keys to false$(13_10)if down_key = true and up_key = true {$(13_10)    down_key = false;$(13_10)    up_key = false;$(13_10)} if right_key = true and left_key = true {$(13_10)    right_key = false;$(13_10)    left_key = false;$(13_10)}$(13_10)$(13_10)$(13_10)$(13_10)//check any_key for interactivity scripts calling for any activity$(13_10)if menu_key or question_key or interact_key or run_key or$(13_10)        up_key or down_key or right_key or left_key {$(13_10)    any_key = true;$(13_10)} else {$(13_10)    any_key = false;$(13_10)}$(13_10)$(13_10)"
/// @desc input cleanup

//if any move commands cross (up+down, right+left) set both keys to false
if down_key = true and up_key = true {
    down_key = false;
    up_key = false;
} if right_key = true and left_key = true {
    right_key = false;
    left_key = false;
}



//check any_key for interactivity scripts calling for any activity
if menu_key or question_key or interact_key or run_key or
        up_key or down_key or right_key or left_key {
    any_key = true;
} else {
    any_key = false;
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 74FBA5F3
/// @DnDArgument : "code" "/// @desc buttons display$(13_10)$(13_10)//manage visual appearance of d-pad and other gui buttons$(13_10)if up_key or down_key or right_key or left_key {$(13_10)	if instance_exists(dPad) with dPad {$(13_10)		if other.left_key {$(13_10)			dir = LEFT;$(13_10)			//show_debug_message("Going left");$(13_10)		} else if other.right_key {$(13_10)			dir = RIGHT;$(13_10)			//show_debug_message("Going right");$(13_10)		} else if other.up_key {$(13_10)			dir = UP;$(13_10)			//show_debug_message("Going up");$(13_10)		} else if other.down_key {$(13_10)			dir = DOWN;$(13_10)			//show_debug_message("Going down");$(13_10)		}$(13_10)	}$(13_10)}$(13_10)$(13_10)if interact_key and instance_exists(talkButton) {$(13_10)	with talkButton			active=true;$(13_10)} else if instance_exists(talkButton) and !talkButton.hover {$(13_10)	with talkButton			active=false;$(13_10)} $(13_10)if question_key and instance_exists(askButton) {$(13_10)	with askButton			active=true;$(13_10)} else if instance_exists(askButton) and !askButton.hover {$(13_10)	with askButton			active=false;$(13_10)} $(13_10)if menu_key and instance_exists(menuButton) {$(13_10)	with menuButton			active=true;$(13_10)} else if instance_exists(menuButton) and !menuButton.hover {$(13_10)	with menuButton			active=false;$(13_10)} $(13_10)if run_key and instance_exists(runButton) {$(13_10)	with runButton			active=true;$(13_10)} else if instance_exists(runButton) and !runButton.hover {$(13_10)	with runButton			active=false;$(13_10)}"
/// @desc buttons display

//manage visual appearance of d-pad and other gui buttons
if up_key or down_key or right_key or left_key {
	if instance_exists(dPad) with dPad {
		if other.left_key {
			dir = LEFT;
			//show_debug_message("Going left");
		} else if other.right_key {
			dir = RIGHT;
			//show_debug_message("Going right");
		} else if other.up_key {
			dir = UP;
			//show_debug_message("Going up");
		} else if other.down_key {
			dir = DOWN;
			//show_debug_message("Going down");
		}
	}
}

if interact_key and instance_exists(talkButton) {
	with talkButton			active=true;
} else if instance_exists(talkButton) and !talkButton.hover {
	with talkButton			active=false;
} 
if question_key and instance_exists(askButton) {
	with askButton			active=true;
} else if instance_exists(askButton) and !askButton.hover {
	with askButton			active=false;
} 
if menu_key and instance_exists(menuButton) {
	with menuButton			active=true;
} else if instance_exists(menuButton) and !menuButton.hover {
	with menuButton			active=false;
} 
if run_key and instance_exists(runButton) {
	with runButton			active=true;
} else if instance_exists(runButton) and !runButton.hover {
	with runButton			active=false;
}