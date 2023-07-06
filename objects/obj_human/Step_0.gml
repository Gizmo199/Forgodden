with ( obj_gate )
{
	if ( triggered ) 
	{
		with ( other )
		{
			hurt = true;
			if ( !start_timer )
			{
				start_timer = true;
				alarm[0] = 400;
			}
		}	
	}
}	

health_update(x, y);
audio_sound_gain(hbeat, 1-(point_distance(x, y, obj_player.x, obj_player.y)/128), 0);