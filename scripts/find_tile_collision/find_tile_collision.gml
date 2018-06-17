///@desc find tile collisions at the given x and y coordinates
// @param x
// @param y

var xx = argument0+4;
var yy = argument1-4;

//check the fence layer
var tile_fence = tilemap_get_at_pixel(layer_tilemap_get_id("fences"), xx, yy);
if tile_fence != 0 and tile_fence != 589	{	return collision_types.solid; exit;	}

//check the building layers
var tile_wall = tilemap_get_at_pixel(layer_tilemap_get_id("walls_main"), xx, yy);
if tile_wall != 0	{	return collision_types.solid;	exit;	}
tile_wall = tilemap_get_at_pixel(layer_tilemap_get_id("walls_extensions"), xx, yy);
if tile_wall != 0	{	return collision_types.solid;	exit;	}

//tilemap_get_cell_y_at_pixel(tile_layer, xx, yy);

//check the water layer
var tile_road = tilemap_get_at_pixel(layer_tilemap_get_id("roads"), xx, yy);
var tile_terrain = tilemap_get_at_pixel(layer_tilemap_get_id("terrain"), xx, yy);
var tile_water = tilemap_get_at_pixel(layer_tilemap_get_id("water"), xx, yy);
if tile_water != 0 and tile_terrain == 0 and tile_road == 0	{	return collision_types.water;	exit;	}

//check for a grass collision
var tile_grass = tilemap_get_at_pixel(layer_tilemap_get_id("grass"), xx, yy)
if tile_grass != 0 {	return collision_types.grass; exit; }

//check for outside room; no more base tiles here
var tile_base = tilemap_get_at_pixel(layer_tilemap_get_id("base"), xx, yy);
if tile_base = 0 and tile_terrain = 0 and tile_road = 0		{	return collision_types.solid; exit;	}

//if no other conditions for returns are met, return the default, empty, 0 value
return collision_types.empty;