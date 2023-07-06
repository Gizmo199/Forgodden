direction %= 360;
move_dir %= 360;

if ( state != pstate_move ) { audio_sound_gain(walk_audio, 0, 100); }
audio_sound_gain(water_audio, state == pstate_dash, 100);

if ( paused ) state = pstate_pause;
state();

if ( abs(input.axis_rstrength()) > .1 )
{
	var adir = input.axis_rdir();
	aim.x += dcos(adir)*20;
	aim.y += -dsin(adir)*20;
		
	var pd = point_direction(x, y, aim.x, aim.y);
	aim.x = x + dcos(pd)*clamp(aim.x, -32, 32);
	aim.y = y - dsin(pd)*clamp(aim.y, -32, 32);
	mode = "gamepad";
}	
	
if ( point_distance(window_mouse_get_x(), window_mouse_get_y(), mouse_previous.x, mouse_previous.y) > .1 )
{	
	aim.x = mouse_x;
	aim.y = mouse_y;
	mode = "mouse";
}

if ( mode != "mouse" )
{
	aim.x += phy_speed_x;
	aim.y += phy_speed_y;
}
index += (sprite_get_speed(sprite) / room_speed);

mouse_previous.x = window_mouse_get_x();
mouse_previous.y = window_mouse_get_y();
