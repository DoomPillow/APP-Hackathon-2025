

var _mdir = point_direction(x, y, mouse_x, mouse_y);
	if _mdir < 45 {
		_mdir += 360;	
	}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

shader_set(shd_redscale);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, glow);
shader_reset();