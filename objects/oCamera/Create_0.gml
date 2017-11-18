/// @description initialize camera
// You can write your code in this editor

camera = camera_create();
var view_matrix = matrix_build_lookat(x, y, -1000, x, y, 0, 0, 1, 0);
var projection_matrix = matrix_build_projection_ortho(1336, 900, -1000, 10000)

camera_set_view_mat(camera, view_matrix);
camera_set_proj_mat(camera, projection_matrix);

view_camera[0] = camera;

if instance_exists(oPlayer)	follow = oPlayer;
else						follow = noone;
state = 0;
target_x = follow.x;
target_y = follow.y;