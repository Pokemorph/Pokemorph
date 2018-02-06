/// @description init slider bar

/*
	I should note here that the slider bar is meant to be one, single, object. The marker moving along it
	is purely code controlled and drawn by the slider object itself.
	How this will work is, the bar will detect when the bar becomes "active" (when the mouse is clicked 
	over it), and the bar position will instantly move to whatever location on the bar the mouse is 
	located. It will be clamped between the two ends, and the bar will be displayed at that point. In the
	step event, while active is true, it will update the volume live.
*/

event_inherited();
image_speed = 0;
text = "Music"; //define the text printed above the bar
tracker = oGameControl.volume_music*100
bar_position = x+tracker+6; //track the mouse's position on the bar and display current level