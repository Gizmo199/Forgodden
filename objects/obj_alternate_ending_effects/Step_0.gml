ss = lerp(ss, 1, 0.01);
screen_shake(ss*2);

part_particles_create(psys, random(room_width), random(room_height), p_type, 1);

if ( room == rm_tutorial && global._humanSaved )
{
	alpha = 1-(point_distance(obj_player.x, obj_player.y, obj_gateway.x, obj_gateway.y)/128) + ( pitch*.01 );
	var sn = 1-(point_distance(obj_player.x, obj_player.y, obj_gateway.x, obj_gateway.y)/480);
	audio_sound_pitch(wnoise, pitch);
	audio_sound_gain(wnoise, (.25 + ( sn * .75 )) * .5, 0);
	
	with ( obj_player )
	{
		if ( y > obj_gateway.y - 128 )
		{
			state = pstate_endwalk;
			other.pitch+=.075;
			
			if ( y > obj_gateway.y )
			{
				paused = true;
				state = pstate_pause;
			}
		}
	}
	
	if ( pitch > 17 )
	{	
		with ( obj_player )
		{
			var cx = cam.view_x - cam.view_width*.5;
			var cy = cam.view_y - cam.view_height*.5;
			instance_create_layer(x - cx, y - cy, layer, obj_final_player_strike);
		}
		room_goto(rm_ending);
		instance_destroy();
	}
}

if ( room == rm_boss_to && !global._humanSaved )
{
	alpha = 1-(point_distance(obj_player.x, obj_player.y, obj_gateway.x, obj_gateway.y)/128) + ( pitch*.01 );
	var sn = 1-(point_distance(obj_player.x, obj_player.y, obj_gateway.x, obj_gateway.y)/480);
	audio_sound_pitch(wnoise, pitch);
	audio_sound_gain(wnoise, (.25 + ( sn * .75 )) * .5, 0);
	
	with ( obj_player )
	{
		if ( y < obj_gateway.y + 96 )
		{
			state = pstate_endwalk;
			other.pitch+=.075;
			
			if ( y < obj_gateway.y )
			{
				paused = true;
				state = pstate_pause;
			}
		}
	}
	
	if ( pitch > 17 )
	{	
		with ( obj_player )
		{
			var cx = cam.view_x - cam.view_width*.5;
			var cy = cam.view_y - cam.view_height*.5;
			instance_create_layer(x - cx, y - cy, layer, obj_final_player_strike);
		}
		room_goto(rm_ending);
		instance_destroy();
	}
}