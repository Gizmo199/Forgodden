if ( collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player, false, true) )
{
	//with ( obj_spawn_final ) 
	//{
	//	triggered = true;
	//}
	
	instance_create_layer(x, y, layer, obj_boss_doppleganger);
	
	global._startpos.x = obj_player.phy_position_xprevious;
	global._startpos.y = obj_player.phy_position_yprevious + 32;
	
	with ( obj_gate_final )
	{
		triggered = true;
		white = true;
			
		alarm[0] = irandom_range(5, 15);	
	}
	
	instance_destroy();
}
