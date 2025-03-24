
xshift += xspeed * global.delta;
yshift += yspeed * global.delta;

if instance_exists(camera) {
	draw_sprite_tiled(spr_background, global.backgroundcolor, xshift + (camera.camx*0.5), yshift + (camera.camy*0.5));
} else {
	draw_sprite_tiled(spr_title_background, global.backgroundcolor, xshift, yshift);	
}