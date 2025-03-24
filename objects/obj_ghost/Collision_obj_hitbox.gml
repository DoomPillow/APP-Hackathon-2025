
if iframes > 0 exit;

iframes = 10;
hp-= other.damage;

if hp <= 0 {
	instance_destroy();	
}

image_blend = c_red;
image_xscale = 1.2;
image_yscale = 0.8;

var _dir = other.image_angle;
hsp = lengthdir_x(10, _dir);
vsp = lengthdir_y(10, _dir);

