phy_position_x = lerp(phy_position_x, target.x, .08);
phy_position_y = lerp(phy_position_y, target.y, .08);

zspeed += 0.1;
z += zspeed;

if ( z >= 0 )
{
	if ( collision_circle(x, y, 6, obj_player, false, true) )
	{
		with ( obj_player )
		{
			player_die();	
		}
	}
	instance_destroy();	
}