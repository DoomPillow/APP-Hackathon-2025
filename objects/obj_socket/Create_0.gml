
partner = noone;

good = false;
if !is_menu {
	partner = instance_create_layer(x + random_range(-110, 110), y  + random_range(-110, 110), layer, par_furniture); 
	image_index = partner.furniture_type;
} else {
	image_index = 4;
}