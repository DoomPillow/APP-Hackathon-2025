
iframes -= global.delta;

jumpcooldown -= global.delta;

if jumpcooldown <= 0 {
	jumpcooldown = random_range(40, 90);
	zsp = 4;
	var _dir = point_direction(x, y, obj_player.x, obj_player.y);
	hsp = lengthdir_x(5, _dir);
	vsp = lengthdir_y(5, _dir);
} else {
	if jumpcooldown < 20 {
		image_index = 1;	
	} else {
		image_index = 0;
	}
}

zsp += grv * global.delta;
z += zsp * global.delta; 
z = max(0, z);

if z == 0 {
	hsp = delta_lerp(hsp, 0, fruck);
	vsp = delta_lerp(vsp, 0, fruck);
	
	flip = obj_player.x < x ? -1 : 1;
	
} else {
	image_index = 2;	
}

x += hsp * global.delta;
y += vsp * global.delta;

image_blend = merge_color(image_blend, c_white, 0.2);
image_xscale = delta_lerp(image_xscale, 1, 0.2);
image_yscale = delta_lerp(image_yscale, 1, 0.2);
