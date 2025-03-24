
x += lengthdir_x(projectile_speed, direction) * global.delta;
y += lengthdir_y(projectile_speed, direction) * global.delta;

lifetime -= global.delta;
if lifetime <= 0 {
	instance_destroy();	
}