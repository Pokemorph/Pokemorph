/// @desc draw depth objects

if instance_exists(parDepth) {
	//first, we generate a grid to contain instance IDs and the y position
	var grid_height = instance_number(parDepth);
	var dg = ds_grid_create(2, grid_height)
	ds_grid_clear(dg, noone)
	var counter = 0
	
	//then we add those objects and their y coordinates to the grid
	with parDepth {
		if !invisible {
			dg[# 0, counter] = id;
			dg[# 1, counter] = y;
			counter++;
		}
	}
	
	//sort the grid by y coordinates
	ds_grid_sort(dg, 1, true);
	
	//finally, draw every depth object in order of high ` to low ,
	counter = 0;
	repeat(grid_height) {
		var instanceID = dg[# 0, counter];
		with instanceID event_perform(ev_draw, 0)
		counter++;
	}
	
	//and before we close the script, destroy the grid to avoid a memory leak
	ds_grid_destroy(dg)
}