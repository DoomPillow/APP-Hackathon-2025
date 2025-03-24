
var _mdir = point_direction(x, y, obj_player.x - obj_player.hsp, obj_player.y - obj_player.vsp);

if _mdir > 45 && _mdir < 135 {
	image_index = 0;
} else {
	if _mdir < 45 {
		_mdir += 360;	
	}
	image_index = round( 1.1 * (_mdir - 135) / (270 / 7));
}

glow = delta_lerp(glow, 0, 0.04);
cooldown -= global.delta;
if cooldown <= 0 && place_meeting(x, y, obj_floor) {
	cooldown = random_range(80, 300);
	glow = 1;
	instance_create_layer(x + lengthdir_x(16, _mdir), y + lengthdir_y(16, _mdir), layer, obj_laser, {image_angle: _mdir + random_range(-10, 10)});
	hsp += lengthdir_x(-5, _mdir);
	vsp += lengthdir_y(-5, _mdir);
}

movecooldown -= global.delta;

if movecooldown <= 0 {
	
	movecooldown = random_range(15, 70);
	
	if point_distance(x, y, obj_player.x, obj_player.y) > 50 {
		hsp = lengthdir_x(5, _mdir + random_range(-90, 90));	
		vsp = lengthdir_y(5, _mdir + random_range(-90, 90));	
	} else {
		hsp = lengthdir_x(-5, _mdir + random_range(-120, 120));	
		vsp = lengthdir_y(-5, _mdir + random_range(-120, 120));	
	}
	
}

hsp = delta_lerp(hsp, 0, 0.05);
vsp = delta_lerp(vsp, 0, 0.05);

x += hsp * global.delta;
y += vsp * global.delta;

iframes -= global.delta;
image_blend = merge_color(image_blend, c_white, 0.2);
image_xscale = delta_lerp(image_xscale, 1, 0.2);
image_yscale = delta_lerp(image_yscale, 1, 0.2);