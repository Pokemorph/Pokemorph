/// @desc cleanup the menu
// You can write your code in this editor

// Inherit the parent event
event_inherited();

for (var i=0; i<array_length_1d(page_controls); i++) {
	if instance_exists(page_controls[i])		with page_controls[i]	{
		instance_destroy();
	}
}

with stats_page instance_destroy();
with button_return instance_destroy();
with button_choose instance_destroy();
with slider instance_destroy();
with slider_right instance_destroy();
with slider_left instance_destroy();
with checkbox instance_destroy();