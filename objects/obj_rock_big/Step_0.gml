if ( z < 0 )
{
	zspeed += .25;	
	phy_active = false;
}
else
{
	phy_active = true;
	
	first_hit = true;
	z = 0;
	zspeed *= -.5;
	
	if ( abs(zspeed) < .5 )
	{
		zspeed = 0;
		//z = 0;
		
		image_alpha -= 0.05;
	}
	
	can_kill--;
}
z += zspeed;

if ( image_alpha < 0 ) instance_destroy();

phy_speed_x = lerp(phy_speed_x, 0, 0.1);
phy_speed_y = lerp(phy_speed_y, 0, 0.1);

phy_position_x += phy_speed_x;
phy_position_y += phy_speed_y;
