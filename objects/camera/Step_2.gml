
var view = view_camera[0];

camera_set_view_size(view, view_width * (2 / zoom), view_height * (2 / zoom));

if instance_exists(obj_player) {
	
	camx = delta_lerp(camx, obj_player.x - view_width/zoom, 0.3);
	camy = delta_lerp(camy, obj_player.y - view_height/zoom, 0.3);
	//camx = clamp(camx, view_width/2, room_width - view_width);
	//camy = clamp(camy, view_height/2, room_height - view_height);
	
	camera_set_view_pos(view, camx, camy);

}