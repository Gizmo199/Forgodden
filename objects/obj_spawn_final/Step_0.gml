if ( triggered )
{	
	if ( boss_to_spawn != noone )
	{
		var _hp = -1;
		if ( boss_to_spawn == obj_boss_fire )
		{
			with ( obj_boss_fire_section )
			{
				instance_create_layer(x-8, y-8, layer, obj_fire_pit);
				instance_create_layer(x+8, y-8, layer, obj_fire_pit);
				instance_create_layer(x-8, y+8, layer, obj_fire_pit);
				instance_create_layer(x+8, y+8, layer, obj_fire_pit);
			
				instance_create_layer(x, y, layer, obj_boss_fire_section);
				instance_destroy();
			}
			
			_hp = 3;
		}
		if ( boss_to_spawn == obj_cloud )
		{
			_hp = 8;	
		}
		var ins = instance_create_layer(x, y, layer, boss_to_spawn);
		if ( _hp == -1 )
		{
			var _hp = round(ins.hp_max*.5);
		}
		ins.hp = _hp;
		instance_destroy();
	}
}