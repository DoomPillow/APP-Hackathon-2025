
if partner != noone {
	
	var _meeting = instance_place(x, y, par_furniture);
	if instance_exists(_meeting) {
		good = _meeting.furniture_type == partner.furniture_type;	
	} else {
		good = false;	
	}

} else if is_menu {
	var _meeting = instance_place(x, y, par_furniture);
	if _meeting != noone {
		if _meeting.sprite_index == spr_menutables {
			if _meeting.image_index == 0 {
				controller.should_transition = true;
				good = true;
				_meeting.hsp = delta_lerp(_meeting.hsp, 0, 0.01);
				_meeting.vsp = delta_lerp(_meeting.vsp, 0, 0.01);
			} else {
				game_end();
			}
		}
	}
}