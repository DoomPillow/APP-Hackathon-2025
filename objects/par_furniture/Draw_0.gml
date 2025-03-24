
draw_sprite_ext(spr_shadow, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, 1);


if held {
	
	var _dir = (3 * global.time) % 360;
	
	gpu_set_blendmode(bm_add);
	shader_set(shd_ghostly)
	
	draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(5, _dir), y - z + lengthdir_y(5, _dir), image_xscale, image_yscale, image_angle, image_blend, 0.2);
	draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(5, _dir + 180), y - z + lengthdir_y(5, _dir+180), image_xscale, image_yscale, image_angle, image_blend, 0.2);
	
	shader_reset();
	gpu_set_blendmode(bm_normal);
}