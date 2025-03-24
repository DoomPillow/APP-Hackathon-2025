
event_inherited();

furniture_type = irandom(3);
switch furniture_type {
	case 0: sprite_index = spr_table break;
	case 1: sprite_index = spr_flowerpot break;
	case 2: sprite_index = spr_wardrobe break;
	case 3: sprite_index = spr_lamp break;
}

hsp = 0;
vsp = 0;
zsp = 0;
z = 0;
grv = -0.5

fruck = 0.25;

held = false;
holder = noone;

is_projectile = false;