image_index = irandom_range(0,image_number-1);
image_speed = 0;

can_grow = false;
can_die = false;
grow_time = 60;
grow = 0;

if ( global._reward.earth.got )
{
	grow_time = 45;	
}

depth_enable();
reflect_enable();

damage = 1;

sound_id = -1;
