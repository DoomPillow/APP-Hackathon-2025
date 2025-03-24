
switch state {
	
	case 0:
		
		flip = obj_player.x < x ? -1 : 1;
	
		var _dir = point_direction(x, y, obj_player.x, obj_player.y);
		var _dist = point_distance(x, y, obj_player.x, obj_player.y);
		if _dist > 150 {
			direction += angle_difference(_dir, direction) * 0.25 * global.delta;
			swerve = choose(-90, -20, 20, 90);
		} else {
			direction += angle_difference(_dir, direction) * 0.25 * global.delta + swerve;
		}
		hsp += lengthdir_x(0.05, direction) * global.delta;
		vsp += lengthdir_y(0.05, direction) * global.delta;
		
		timer -= global.delta;
		spat -= global.delta;
		
		if spat <= 0 {
			sprite_index = spr_slimeboy;
		}
		
		if timer <= 0 && _dist < 250 {
			state = 1
			timer = 50;
			sprite_index = spr_slimeboy_suckspit;
		}
	break;
	case 1:
		image_index = 0;
		var _dir = point_direction(x, y, obj_player.x, obj_player.y);
		hsp = delta_lerp(hsp, 0, 0.05)
		vsp = delta_lerp(vsp, 0, 0.05);
		timer -= global.delta;
		if timer <= 0 {
			state = 0;
			timer = irandom_range(200,400);
			image_index = 1;
			instance_create_layer(x, y, layer, obj_slimeball, {direction: _dir});
			hsp = lengthdir_x(-15, _dir);
			vsp = lengthdir_y(-15, _dir);
			spat = 60;
		}
	break;
	
}

hsp = clamp(hsp, -maxsp, maxsp);
vsp = clamp(vsp, -maxsp, maxsp);

x += hsp * global.delta;
y += vsp * global.delta;

iframes -= global.delta;
image_blend = merge_color(image_blend, c_white, 0.2);
image_xscale = delta_lerp(image_xscale, 1, 0.2);
image_yscale = delta_lerp(image_yscale, 1, 0.2);