
beat -= global.delta;

if beat <= 0 {
	if dingle_dongle {
		beat = 60;
	} else {
		beat = 20;
	}
	image_xscale = 1.3;
	image_yscale = 1.3;
	dingle_dongle = !dingle_dongle;
}

image_xscale = delta_lerp(image_xscale, 1, 0.05);
image_yscale = delta_lerp(image_yscale, 1, 0.05);