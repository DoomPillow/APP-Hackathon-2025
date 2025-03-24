
var dgrid = ds_depthgrid;
var inst_num = instance_number(par_depth);
ds_grid_resize(dgrid,2,inst_num);


var yy = 0; with(par_depth){
	dgrid[# 0,yy] = id;
	dgrid[# 1,yy] = y + (x / room_width);
	yy++;
}


ds_grid_sort(dgrid,1,true);

var inst;
yy = 0; repeat(inst_num){
	var inst = dgrid[# 0 , yy];
	with(inst) {
		event_perform(ev_draw,0);
	}
	yy++;
}