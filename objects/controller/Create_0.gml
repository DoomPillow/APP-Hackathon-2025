
randomize();

clutters =   [];
furnitures = [];

padding = 700;
alpha = 0;
buttony = 2000;
death_radius = 1000;
deathsurf = surface_create(room_width + padding, room_height + padding);

trans_curve = animcurve_get_channel(crv_transition, "curve1");
transitioning = 0; // 0 not, 1 in, 2 out 
trans_in =  0;
trans_out = 0;

level_things = [];

cleanliness = 0;
target_cleanliness = 0;

level_create = function() {
	
	// Randomize color scheme
	obj_background.xspeed = random_range(-10, 10) * 0.05;
	obj_background.yspeed = random_range(-10, 10) * 0.05;
	
	global.wallcolor = choose(spr_wall1, spr_wall2, spr_wall3, spr_wall4, spr_wall5);
	global.backgroundcolor = irandom(sprite_get_number(spr_background));
	
	// Generate room
	sprite_get_data(spr_house, irandom(sprite_get_number(spr_house)-1) , function(_x, _y, _col) {
	
		switch _col {
			case c_white:
				var _inst = instance_create_layer(_x*32, _y*32, "walls", obj_wall, {sprite_index: global.wallcolor});
				array_push(level_things, _inst);
			break;
			case #666666: 
				var _inst = instance_create_layer(_x*32, _y*32, "floors", obj_floor);
				array_push(level_things, _inst);
			break;
			case #00FFFF:
				var _inst = instance_create_layer(_x*32, _y*32, "walls", obj_wall, {sprite_index: global.wallcolor, image_index: 2});
				var _inst2 = instance_create_layer(_x*32, (_y+1)*32, "floors", obj_floor, {image_index: 1});
				array_push(level_things, _inst);
				array_push(level_things, _inst2);
				obj_player.x = _x*32 + 16;
				obj_player.y = (_y+1)*32 + 16;
			break;
			case #EE1C24:
				var _inst = instance_create_layer(_x*32, _y*32, "floors", obj_floor);
				var _inst2 = instance_create_layer(_x*32, _y*32, "ground", obj_cobweb);
				array_push(level_things, _inst);
				array_push(level_things, _inst2);
				array_push(clutters, _inst2);
			case c_yellow:
				var _inst = instance_create_layer(_x*32, _y*32, "furniture", obj_socket);
				var _inst2 = instance_create_layer(_x*32, _y*32, "floors", obj_floor);
				array_push(level_things, _inst);
				array_push(level_things, _inst2);
				array_push(furnitures, _inst);
			break;
		}
	});
	

	furnitures = array_shuffle(furnitures);
	for (var i = 4; i < array_length(furnitures); i++) {
		with furnitures[i] {
			instance_destroy();
		}
	}

	clutters = array_shuffle(clutters)
	for (var i = 4; i < array_length(clutters); i++) {
		with clutters[i] {
			instance_destroy();
		}
	}
	
	// Add starting enemies
	
	repeat(3) {
		
		switch irandom(2) {
			case 0:
				instance_create_layer(random_range(0, room_width), random_range(0, room_height), "enemies", obj_ghost);
			break;
			case 1:
				var _randx = random_range(0, room_width);
				var _randy = random_range(0, room_height);
				instance_create_layer(_randx + random_range(-20, 20), _randy + random_range(-20, 20), "enemies", obj_slimeboy);
				instance_create_layer(_randx + random_range(-20, 20), _randy + random_range(-20, 20), "enemies", obj_slimeboy);
			break;
			case 2:
				var _randx = random_range(0, room_width);
				var _randy = random_range(0, room_height);
				instance_create_layer(_randx + random_range(-20, 20), _randy + random_range(-20, 20), "enemies", obj_dustbunny);
				instance_create_layer(_randx + random_range(-20, 20), _randy + random_range(-20, 20), "enemies", obj_dustbunny);
				instance_create_layer(_randx + random_range(-20, 20), _randy + random_range(-20, 20), "enemies", obj_dustbunny);
				instance_create_layer(_randx + random_range(-20, 20), _randy + random_range(-20, 20), "enemies", obj_dustbunny);
				
				
			break;
		}
		
	}
	
	target_cleanliness = 0;

}

level_destroy = function() {
	for (var i = 0; i < array_length(level_things); i++) {
		instance_destroy(level_things[i]);	
	}
	level_things = [];
	clutters =   [];
	furnitures = [];
}

should_transition = false;	

spawn_cooldown = 1200;

hurt_alpha = 0;

//level_create();