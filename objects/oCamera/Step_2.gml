/// @description control following
// You can write your code in this editor

if follow != noone and instance_exists(follow) {
	if state = 0 {
		target_x = follow.x;
		target_y = follow.y;
	}
	x = lerp(target_x, x, 0.05);
	y = lerp(target_y, y, 0.05);
}

if x != xprevious or y != yprevious {
	var view_matrix = matrix_build_lookat(x, y, -1000, x, y, 0, 0, 1, 0);
	camera_set_view_mat(camera, view_matrix);
}