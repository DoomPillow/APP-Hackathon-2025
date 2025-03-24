
instance_destroy();

repeat(irandom_range(1, 2)) {
	instance_create_layer(x, y, "enemies", obj_dustbunny);	
}