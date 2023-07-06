with ( obj_player )
{	
	if ( !paused && can_change )
	{
		draw_sprite(sp_player_cursor, 0, aim.x, aim.y);
	}
}

with ( obj_fire_pit )
{
	with ( light )
	{
		gpu_set_blendmode(bm_add);
		draw_self();	
		gpu_set_blendmode(bm_normal);
	}	
}