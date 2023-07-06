z = lerp(z, -8 + ( sin(current_time/240) * 4), 0.01);

image_xscale = dcos(current_time/7.5);

if ( irandom_range(-1, 1) )
{
	with ( con_render )
	{
		part_particles_create(psys, other.x, other.y+other.z, p_type, 1);	
	}
}

var c = collision_circle(x, y-8, 8, obj_player, false, true);
if ( c )
{
	if ( z > -17 )
	{
		switch(image_index)
		{
			case 0:
				global._reward.earth.got = true;
			break;
	
			case 1:
				global._reward.fire.got = true;
			break;
	
			case 2:
				global._reward.water.got = true;
			break;
		}
		instance_destroy();
	
		var fl = instance_create_layer(x, y, layer, obj_flash);
		fl.pause_player = false;
		fl.white = .3;
	
		con_audio.play_sound(snd_reward, 1);
	}
}