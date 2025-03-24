
//cooldown -= global.delta;
//if cooldown <= 0 {
//	alpha = delta_lerp(alpha, 0.5, 0.05);	
//}
//
if point_distance(x, y, obj_player.x, obj_player.y) < 20 {

	instance_destroy();
	obj_player.broomed = true;	

}