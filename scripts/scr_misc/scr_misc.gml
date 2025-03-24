

// Lerp that works with delta time
function delta_lerp(a,b,t) {
	var _lerpAmount = power((1-t),global.delta);
	return lerp( b, a, _lerpAmount);
}

function draw_sprite_better(sprite, subimg, xx, yy, w, h, rot, col, alpha) {
	var spr_width = sprite_get_width(sprite);
	var spr_height = sprite_get_height(sprite);
	draw_sprite_ext(sprite, subimg, xx, yy, (1/spr_width) * w, (1/spr_height) * h, rot, col, alpha);
}

function draw_9slice_scaled(sprite, subimg, xx, yy, x1, x2, y1, y2, w, h, xscale, yscale, rot, col, alpha) {
	
	// Mmmmm... data
	var spr_w = sprite_get_width(sprite);
	var spr_h = sprite_get_height(sprite);
	
	// For maintaining width and height while increasing scale
	var sx1 = x1 * xscale;
	var sx2 = x2 * xscale;
	var sy1 = y1 * yscale;
	var sy2 = y2 * yscale;
	
	var _rows =		h div ((spr_h*yscale) - sy1 - sy2);
	var _columns =	w div ((spr_w*xscale) - sx1 - sx2);
	
	//// Draw corners
	// Top left corner
	draw_sprite_part_ext(sprite, subimg,		0, 0, x1, y1, xx, yy, xscale, yscale, col, alpha);
	// Top right corner							
	draw_sprite_part_ext(sprite, subimg,		spr_w - x2, 0, x2, y1, xx+w-sx2, yy, xscale, yscale, col, alpha);
	// Bottom left corner						
	draw_sprite_part_ext(sprite, subimg,		0, spr_h - y2, x1, y2, xx, yy+h-sy2, xscale, yscale, col, alpha);
	// Bottom right corner						
	draw_sprite_part_ext(sprite, subimg,		spr_w - x2, spr_h - y2, x2, y2, xx+w-sx2, yy+h-sy2, xscale, yscale, col, alpha);
	
	//// Draw edges
	for (var i = 0; i <= _rows; i++) {
		var _semi_length = (h - sy1 - sy2 - (((spr_h*yscale) - sy1 - sy2)*(_rows))) / yscale;
		if _semi_length < 0 && i == _rows-1 { var _length = (((spr_h*yscale) - sy1 - sy2)/yscale) + _semi_length }
		else { var _length = i == _rows ? _semi_length : ((spr_h*yscale) - sy1 - sy2)/yscale; }

		// Left edge
		draw_sprite_part_ext(sprite, subimg,	0, y1, x1, _length, xx, yy+sy1+(((spr_h*yscale) - sy1 - sy2)*i), xscale, yscale, col, alpha);
		// Right edge
		draw_sprite_part_ext(sprite, subimg,	spr_w - x2, y1, x2, _length, xx+w-sx2, yy+sy1+(((spr_h*yscale) - sy1 - sy2)*i), xscale, yscale, col, alpha);
	}
	
	for (var i = 0; i <= _columns; i++) {
		var _semi_length = (w - sx1 - sx2 - (((spr_w*xscale) - sx1 - sx2)*(_columns))) / xscale;
		if _semi_length < 0 && i == _columns-1 { var _length = (((spr_w*xscale) - sx1 - sx2)/xscale) + _semi_length }
		else { var _length = i == _columns ? _semi_length : ((spr_w*xscale) - sx1 - sx2)/xscale; }

		// Top edge
		draw_sprite_part_ext(sprite, subimg,	x1, 0, _length, y1, xx+sx1+(((spr_w*xscale) - sx1 - sx2)*i), yy, xscale, yscale, col, alpha);
		// Bottom edge
		draw_sprite_part_ext(sprite, subimg,	x1, spr_h - y2, _length, y2, xx+sx1+(((spr_w*xscale) - sx1 - sx2)*i), yy+h-sy2, xscale, yscale, col, alpha);
	}
	
	//// Draw center
	// X
	for (var i = 0; i <= _columns; i++) {
		var X_semi_length = (w - sx1 - sx2 - (((spr_w*xscale) - sx1 - sx2)*(_columns))) / xscale;
		if X_semi_length < 0 && i == _columns-1 { var X_length = (((spr_w*xscale) - sx1 - sx2)/xscale) + X_semi_length }
		else { var X_length = i == _columns ? X_semi_length : ((spr_w*xscale) - sx1 - sx2)/xscale; }
		// Y
		for (var j = 0; j <= _rows; j++) {
			var Y_semi_length = (h - sy1 - sy2 - (((spr_h*yscale) - sy1 - sy2)*(_rows))) / yscale;
			if Y_semi_length < 0 && j == _rows-1 { var Y_length = (((spr_h*yscale) - sy1 - sy2)/yscale) + Y_semi_length }
			else { var Y_length = j == _rows ? Y_semi_length : ((spr_h*yscale) - sy1 - sy2)/yscale; }
			
			// Center
			draw_sprite_part_ext(sprite, subimg,	x1, y1, X_length, Y_length, xx+sx1+(((spr_w*xscale) - sx1 - sx2)*i), yy+sy1+(((spr_h*yscale) - sy1 - sy2)*j), xscale, yscale, col, alpha);
		}
	}
	
}

function unstuck(){

		for (var i = 0; i < 64; i+=8) {
			
			// Right
			if(!place_meeting(x + i,y,par_collidable)) {
				x += i;
				break;
			}
			// Left
			if(!place_meeting(x - i,y,par_collidable)) {
				x -= i;
				break;
			}
			// Up
			if(!place_meeting(x,y - i,par_collidable)) {
				y -= i;
				break;
			}
			// Down
			if(!place_meeting(x,y + i,par_collidable)) {
				y += i;
				break;
			}
		}

}
	
function approach(a, b, increment)
{
    if (a < b) {
        a += increment;
        if (a > b) {
            return b;
        }
    } else {
        a -= increment;
    
        if (a < b) {
            return b;
        }
    }
    
    return a;
}