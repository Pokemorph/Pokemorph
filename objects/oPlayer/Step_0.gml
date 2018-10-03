///@desc Run State Engine
if(!instance_exists(oFade)){
	script_execute(state);
	animate_actor();
} else {
	image_index = 0;
}
