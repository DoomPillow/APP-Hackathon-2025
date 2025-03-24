
event_inherited();

var _dir = random(360);

if holding != noone {
	holding.zsp = 4;
	holding.hsp = lengthdir_x(5, _dir);
	holding.vsp = lengthdir_y(5, _dir);
	holding.held = false;
	holding.holder = noone;
	holding = noone;
}

