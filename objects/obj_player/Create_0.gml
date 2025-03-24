
event_inherited();

hsp = 0;
vsp = 0;
fruck = .3;
accel = .7;

maxhp = 6;
hp = maxhp;
iframes = 0;
broomed = true;

cooldown = 10;
offswing = false;

maxsp = 4;

player_move = function() {
	
	#region movement

	//check for X and Y input
	var inputX = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	var inputY = keyboard_check(ord("S")) - keyboard_check(ord("W"));

	//Calculate Acceleration
	if inputX !=0 {
		hsp += (inputX*accel) * global.delta;
		hsp = clamp(hsp,(-maxsp + abs(inputY*.65)),(maxsp - abs(inputY*.65)));
	} else {
		hsp = delta_lerp(hsp,0,fruck);
	}


	//Calculate Acceleration
	if inputY !=0 {
		vsp += (inputY*accel) * global.delta;
		vsp = clamp(vsp,(-maxsp + abs(inputX*.65)),(maxsp - abs(inputX*.65)));
	} else {
		vsp = delta_lerp(vsp,0,fruck);
	}

	#endregion movement
	
	return (inputX != 0) || (inputY != 0) ? true : false;
	
}

broom_dir = 0;