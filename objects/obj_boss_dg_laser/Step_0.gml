grow = lerp(grow, !laser, 0.025);
if ( grow > .9 && !laser )
{
	laser = true;	
	screen_shake(3);
	
	if ( collision_circle(x, y, 2, obj_player, false, true) )
	{
		with ( obj_player )
		{
			player_die();	
		}
	}
	
	z = -room_height;
	
	//var fl = instance_create_layer(x, y, layer, obj_flash);
	//fl.white = .25;
	//fl.pause_player = false;
}

if ( grow < .5 && laser )
{
	instance_destroy();
}