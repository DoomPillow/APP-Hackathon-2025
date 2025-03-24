
//x += hsp * global.delta;
//y += vsp * global.delta;

zsp += grv * global.delta;
z += zsp * global.delta; 
z = max(0, z);

if z == 0 {
	hsp = delta_lerp(hsp, 0, fruck);
	vsp = delta_lerp(vsp, 0, fruck);
	is_projectile = false;
}

image_xscale = delta_lerp(image_xscale, 1, 0.2);
image_yscale = delta_lerp(image_yscale, 1, 0.2);


move_and_collide(hsp * global.delta, vsp * global.delta, par_collidable);

if !place_meeting(x, y, obj_floor) {
	var _nearest = instance_nearest(x, y, obj_floor);
	x = _nearest.x;
	y = _nearest.y;
	
}