/// @desc draw depth objects

if instance_exists(oPlayer) {
	var grid_height = instance_number(parSolid) + 1
	var dg = ds_grid_create(2, grid_height)
	ds_grid_clear(dg, noone)
	var counter = 0
	
	with oPlayer {
		dg[# 0, counter] = id;
		dg[# 1, counter] = y;
		counter++;
	}
	with parSolid {
		dg[# 0, counter] = id;
		dg[# 1, counter] = y;
		counter++;
	}
	
	ds_grid_sort(dg, 1, true);
	
	counter = 0;
	repeat(grid_height) {
		var instanceID = dg[# 0, counter];
		//with instanceID draw_self();		//interesting, this version is much faster, though it can't handle extra tasks
		with instanceID event_perform(ev_draw, 0)
		counter++;
	}
	
	ds_grid_destroy(dg)
}