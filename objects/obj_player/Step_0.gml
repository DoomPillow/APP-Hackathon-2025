
//player_collide();
if hp > 0 {
	player_move();
}
move_and_collide(hsp * global.delta, vsp * global.delta, par_collidable);


var _mdir = point_direction(x, y, mouse_x, mouse_y);

if offswing {
	broom_dir += angle_difference(_mdir + 80, broom_dir) * 0.2;
} else {						  
	broom_dir += angle_difference(_mdir - 80, broom_dir) * 0.2;
}

cooldown -= global.delta;

if mouse_check_button_pressed(mb_left) && cooldown <= 0 && broomed {
	instance_create_layer(x + lengthdir_x(50, _mdir), y - 5 + lengthdir_y(50, _mdir), layer, obj_hitbox, {image_yscale: offswing ? 1: -1, image_angle: _mdir});
	offswing = !offswing;
	cooldown = 10;
}

if mouse_check_button_pressed(mb_right) && broomed {
	broomed = false;
	instance_create_layer(x, y, layer, obj_broom_projectile, {direction: _mdir, clockwise: (_mdir < 90 || _mdir > 270) ? true : false});
}

iframes -= global.delta;

image_blend = merge_color(image_blend, c_white, 0.2);

if hp <= 0 {
	broomed = false;
	image_index = 1;
	image_angle = delta_lerp(image_angle, 90, 0.2);
	hsp = delta_lerp(hsp, 0, 0.2);
	vsp = delta_lerp(vsp, 0, 0.2);
}