if ( target )
{
	if ( !instance_exists(target) ){ instance_destroy(); exit; }
	direction+=15;
	phy_speed_x = 0;
	phy_speed_y = 0;
	phy_position_x = target.x + dcos(-direction) * abs(z*.5);
	phy_position_y = target.y + dsin(-direction) * abs(z*.5);
	if ( z > -64 )
	{
		z -=2;
	}
	phy_rotation = -(direction+90);
}
else
{
	phy_speed_x = dcos(-direction)*speed;
	phy_speed_y = dsin(-direction)*speed;
	phy_rotation = -direction;
}

visible = true;