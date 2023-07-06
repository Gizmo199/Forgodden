if ( !triggered )
{
	screen_shake(5);
}
else
{
	if ( !instance_exists(obj_player) )
	{
		instance_create_layer(global._startpos.x, global._startpos.y, "Instances", obj_player);
	}
	instance_destroy();	
}