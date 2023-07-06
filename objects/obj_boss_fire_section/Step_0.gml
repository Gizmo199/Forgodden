active = 0;
for ( var i=0; i<array_length(pit_id); i++ )
{
	active += pit_id[i].on;
}

var c = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_boss_phoenix_flame, false, true);
if ( c )
{
	if ( c.z >= -5 )
	{
		ignite_all();
		instance_destroy(c);
	}
}
var c = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player, false, true);
if ( c && array_length(pit_id) > 0 )
{
	if ( c.state == c.pstate_dash )
	{
		if ( !active && room==rm_boss_to )
		{
			con_audio.play_sound(choose(snd_fireball_1, snd_fireball_2, snd_fireball_3));
		}
		for ( var i=0; i<array_length(pit_id); i++ )
		{
			with ( pit_id[i] )
			{
				on = false;	
				triggered = false;
			}
			active = false;
		}
	}
}
