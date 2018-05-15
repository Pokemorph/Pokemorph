/// @desc Get Player Input
// 1st, getting mouse input; 2nd, getting keyboard input

/*
	Get Mouse Input
*/

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


/*
	Get Keyboard and Controller input, and use button input
*/

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


//keyboard directions
right_key = keyboard_check(vk_right) or keyboard_check(ord("D")) or (dPad != noone and mouse_hold == true and dPad.dir == RIGHT);
left_key = keyboard_check (vk_left) or keyboard_check(ord("A"))or (dPad != noone and mouse_hold == true and dPad.dir == LEFT);
down_key = keyboard_check (vk_down) or keyboard_check(ord("S"))or (dPad != noone and mouse_hold == true and dPad.dir == DOWN);
up_key = keyboard_check (vk_up) or keyboard_check(ord("W"))or (dPad != noone and mouse_hold == true and dPad.dir == UP);


//gamepad directions
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

//control the run state
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

//check the interact key
if keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) {
    interact_key = true;
} else if gamepad_is_connected(0) and gamepad_button_check_pressed(0, gp_face1) {
    interact_key = true;
} else if talkButton != noone and talkButton.click == true {
    interact_key = true;
} else {
    interact_key = false;
}

//check the question key
if keyboard_check_pressed(ord("E")) or keyboard_check_pressed(vk_control) {
    question_key = true;
} else if gamepad_is_connected(0) and gamepad_button_check_pressed(0, gp_face2) {
    question_key = true;
} else if askButton != noone and askButton.click == true {
    question_key = true;
} else {
    question_key = false;
}

//check the menu key
if keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_backspace) {
    menu_key = true;
} else if gamepad_is_connected(0) and gamepad_button_check_pressed(0, gp_start) {
    menu_key = true;
} else if menuButton != noone and menuButton.click == true {
    menu_key = true;
} else {
    menu_key = false;
}


/*
	Cleanup Input (remove duplicates and get any_key)
*/

//if any move commands cross (up+down, right+left) set both keys to false
if down_key = true and up_key = true {
    down_key = false;
    up_key = false;
} if right_key = true and left_key = true {
    right_key = false;
    left_key = false;
}

//set any_key for scripts that progress on any key press
if menu_key or question_key or interact_key or run_key or
        up_key or down_key or right_key or left_key {
    any_key = true;
} else {
    any_key = false;
}

/*
	Manage the appearance of the d-pad and other gui buttons
*/

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