

switch state {
	case 0: // Chase player
		var _dir = point_direction(x, y, obj_player.x, obj_player.y) + random_range(-10, 10);
		if point_distance(x, y, obj_player.x, obj_player.y) > 100 {
			hsp += lengthdir_x(0.07, _dir) * global.delta;	
			vsp += lengthdir_y(0.07, _dir) * global.delta;	
		} else {
			hsp -= lengthdir_x(0.06, _dir) * global.delta;	
			vsp -= lengthdir_y(0.06, _dir) * global.delta;	
		}
		
		timer -= global.delta;
		if timer <= 0 {
			state = 2;	
		}
	break;
	
	case 2: // Pick up object
		var _me = id;
		var _nearest_furniture = instance_nearest(x, y, par_furniture);
		
		var _dir = point_direction(x, y, _nearest_furniture.x, _nearest_furniture.y);
		hsp += lengthdir_x(0.05, _dir) * global.delta;	
		vsp += lengthdir_y(0.05, _dir) * global.delta;	
		
		with _nearest_furniture {
			if !held && z == 0 {
				if point_distance(x, y, _me.x, _me.y) < 40 {
					held = true;
					holder = _me;
					_me.holding = id;
				}
				
			}
		}
		
		if holding != noone {
		state = 3;  timer = 200;
		}
	break;
	case 3: //throw held object at player
		if instance_exists(holding) {
			var _dir = point_direction(x, y, obj_player.x, obj_player.y) + random_range(-10, 10);
			if point_distance(x, y, obj_player.x, obj_player.y) > 200 {
				hsp += lengthdir_x(0.2, _dir) * global.delta;	
				vsp += lengthdir_y(0.2, _dir) * global.delta;	
			} else {
				hsp -= lengthdir_x(0.2, _dir) * global.delta;	
				vsp -= lengthdir_y(0.2, _dir) * global.delta;	
			}
			
			holding.x = delta_lerp(holding.x, x, 0.3);
			holding.y = delta_lerp(holding.y, y, 0.3);
			timer -= global.delta;
			if timer <= 0 {
				timer = random_range(100,300);
				state = 0;
				holding.zsp = 6;
				holding.is_projectile = true;
				holding.hsp = lengthdir_x(10 + random(3), _dir);
				holding.vsp = lengthdir_y(10 + random(3), _dir);
				holding.held = false;
				holding.holder = noone;
				holding = noone;
			}
		}
	break;
}

hsp = clamp(hsp, -maxsp, maxsp);
vsp = clamp(vsp, -maxsp, maxsp);

if holding != noone {
	move_and_collide(hsp * global.delta, vsp * global.delta, par_collidable);	
} else {
	x += hsp * global.delta;
	y += vsp * global.delta;
}

iframes -= global.delta;
image_blend = merge_color(image_blend, c_white, 0.2);
image_xscale = delta_lerp(image_xscale, 1, 0.2);
image_yscale = delta_lerp(image_yscale, 1, 0.2);