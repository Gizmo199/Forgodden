if ( !on ) exit;

if ( other.state == other.pstate_dash )
{
	on = false;
	alarm[0] = 200;
	
	part_type_color3(p_type, c_orange, c_gray, c_ltgray);
	part_type_size(p_type, .05, .2, 0, 0);
}
else
{
	other.phy_position_x = other.xstart;
	other.phy_position_y = other.ystart;
	
	screen_shake(5);
	con_audio.play_sound(choose(snd_fire_hit_1, snd_fire_hit_2), .25);
	
	var ins = instance_create_layer(0,0,layer,obj_flash);
	ins.white = .25;
}