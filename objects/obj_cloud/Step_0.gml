health_update(x, y);

state();
if ( raining )
{
	repeat(10)
	{
		var xx = random_range(bbox_left, bbox_right);
		var yy = random_range(bbox_top, bbox_bottom);	
		instance_create_layer(xx, yy, layer, obj_raindrop);
	}
}
if ( hp <= 0 )
{
	instance_destroy();	
}

if ( hp < hp_max * .5 )
{
	my_speed = .008;	
}

audio_sound_gain(rain, raining, 1000);
audio_sound_gain(wind, instance_exists(obj_tornado), 1000);