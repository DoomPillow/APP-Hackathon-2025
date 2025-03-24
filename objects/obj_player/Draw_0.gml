
draw_sprite_ext(spr_player, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);

if broomed {
	draw_sprite_ext(spr_broom, 0, x + lengthdir_x(10, broom_dir), y - 5 + lengthdir_y(10, broom_dir), 1, 1, broom_dir, image_blend, 1);
}

//draw_text(x, y + 8, hp);