///@desc Run State Engine
if(!instance_exists(obj_fade)){
	script_execute(state);
	animate_actor();
} else {
	image_index = 0;
}
