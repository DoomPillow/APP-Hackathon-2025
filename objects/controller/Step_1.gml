
global.delta = delta_time / 1000000 * global.target_fps * global.timescale;
global.time += global.delta;

var _goodness = 0;
var _sockets = 0;
with obj_socket {
	_sockets++;
	if good {
		_goodness++;	
	}
}

target_cleanliness = _goodness / _sockets;
cleanliness = delta_lerp(cleanliness, target_cleanliness, 0.05);


if obj_player.hp <= 0 {
	death_radius = delta_lerp(death_radius, 0, 0.03);
	alpha = delta_lerp(alpha, 0, 0.03);
	buttony = delta_lerp(buttony, display_get_gui_height() / 2, 0.01);
	
	if keyboard_check_pressed(ord("R")) {
		game_restart();	
	}
	
} else if room == rm_game {
	
	
	alpha = delta_lerp(alpha, 1, 0.03);	
}

if target_cleanliness >= 1 {
	should_transition = true;	
}

if global.level == 0 && room == rm_game {
	global.level++;
	level_create();
	cleanliness = 0;
	target_cleanliness = 0;
}


switch transitioning {
	case 0:
	
	if global.level >= 1 && obj_player.hp > 0 {
		spawn_cooldown -= global.delta * global.level;
		
		if spawn_cooldown <= 0 {
			spawn_cooldown = random_range(1000, 1500);
			
			switch irandom(global.level > 2 ? 3 : 2) {
				case 0:
					instance_create_layer(random_range(0, room_width), random_range(0, room_height), "enemies", obj_ghost);
				break;
				case 1:
					var _randx = choose(random_range(-100,0), random_range(room_width, room_width + 100))
					var _randy = choose(random_range(-100,0), random_range(room_height, room_height + 100));
					instance_create_layer(_randx + random_range(-20, 20), _randy + random_range(-20, 20), "enemies", obj_slimeboy);
					instance_create_layer(_randx + random_range(-20, 20), _randy + random_range(-20, 20), "enemies", obj_slimeboy);
				break;
				case 2:
					var _randx = choose(random_range(-100,0), random_range(room_width, room_width + 100))
					var _randy = choose(random_range(-100,0), random_range(room_height, room_height + 100));
					instance_create_layer(_randx + random_range(-20, 20), _randy + random_range(-20, 20), "enemies", obj_dustbunny);
					instance_create_layer(_randx + random_range(-20, 20), _randy + random_range(-20, 20), "enemies", obj_dustbunny);
					instance_create_layer(_randx + random_range(-20, 20), _randy + random_range(-20, 20), "enemies", obj_dustbunny);
					instance_create_layer(_randx + random_range(-20, 20), _randy + random_range(-20, 20), "enemies", obj_dustbunny);
				break;
				case 3:
					var _randx = choose(random_range(-100,0), random_range(room_width, room_width + 100))
					var _randy = choose(random_range(-100,0), random_range(room_height, room_height + 100));
					instance_create_layer(_randx + random_range(-20, 20), _randy + random_range(-20, 20), "enemies", obj_eyeball);
					instance_create_layer(_randx + random_range(-20, 20), _randy + random_range(-20, 20), "enemies", obj_eyeball);
				break;
			}
			
		}
	}
	
	if should_transition {
		transitioning = 1;
		if room != rm_main_menu {
			global.level++;
			with par_enemy {
				instance_destroy();	
			}
		}
	}
	break;
	case 1:
		trans_in = approach(trans_in, 1, global.delta / 75);
		if trans_in >= 1 {
			transitioning = 2;	
			trans_out = 1;
			
			if room == rm_main_menu {
			
				room_goto_next();
			
			} else {
				
				level_destroy();
				level_create();
				
			}
		}
	break;
	case 2:
		trans_in = 0;
		trans_out = approach(trans_out, 0, global.delta / 75);
		if trans_out <= 0 {
			transitioning = 0;
			should_transition = false;
		}
	break; 
}

hurt_alpha = delta_lerp(hurt_alpha, 0, 0.2);