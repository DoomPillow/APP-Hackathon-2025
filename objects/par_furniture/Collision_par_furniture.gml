
if held || z != 0 || other.z != 0 exit;

var _dir = point_direction(other.x, other.y, x, y);
var _spdx = max(0.5, (abs(hsp) + abs(other.hsp)) * 0.5);
var _spdy = max(0.5, (abs(vsp) + abs(other.vsp)) * 0.5);
hsp = lengthdir_x(_spdx, _dir);
vsp = lengthdir_y(_spdy, _dir);

zsp = 3;