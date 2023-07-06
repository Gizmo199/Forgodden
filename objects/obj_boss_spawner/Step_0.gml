switch(global._bossType)
{
	case eBOSS_TYPE.EARTH:
	if ( triggered && !global._bossesBeat.earth )
	{
		instance_create_layer(x, y, layer, obj_boss_earth);
	
		instance_create_layer(x+64, y, layer, obj_boss_earth_hand);
		var ins = instance_create_layer(x-64, y, layer, obj_boss_earth_hand);
		ins.move = false;
	
		var ins = instance_create_layer(0,0,layer,obj_boss_title);
		ins.image_index = 1;
		instance_destroy();
	}
	
	if ( global._reward.earth.earned && !global._reward.earth.got )
	{
		var ins = instance_create_layer(room_width*.5, (room_height*.5)-16, layer, obj_reward);
		ins.image_index = 0;
		instance_destroy();
	}
	
	if ( global._bossesBeat.earth ){ with ( obj_gate ) instance_destroy(); }
	break;
	
	case eBOSS_TYPE.WIND:
	if ( triggered && !global._bossesBeat.wind )
	{
		instance_create_layer(x, y, layer, obj_cloud);
		
		var ins = instance_create_layer(0,0,layer,obj_boss_title);
		ins.image_index = 3;
		instance_destroy();
	}
	
	if ( global._reward.water.earned && !global._reward.water.got )
	{
		var ins = instance_create_layer(room_width*.5, (room_height*.5)-16, layer, obj_reward);
		ins.image_index = 2;
		instance_destroy();
	}
	
	if ( global._bossesBeat.wind ){ with ( obj_gate ) instance_destroy(); }
	break;
	
	case eBOSS_TYPE.FIRE:
	if ( triggered && !global._bossesBeat.fire )
	{
		instance_create_layer(x, y, layer, obj_boss_fire);
		
		var ins = instance_create_layer(0,0,layer,obj_boss_title);
		ins.image_index = 2;
		instance_destroy();
	}
	
	if ( global._reward.fire.earned && !global._reward.fire.got )
	{
		var ins = instance_create_layer(room_width*.5, (room_height*.5)-16, layer, obj_reward);
		ins.image_index = 1;
		instance_destroy();
	}
	
	if ( global._bossesBeat.fire ){ with ( obj_gate ) instance_destroy(); }
	break;
}