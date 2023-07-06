if ( !hit )
{
	draw_self_stacked(z,zscale);
}
else
{
	hitflash_set();
	draw_self_stacked(z,zscale);
	hitflash_reset();
}

if ( !instance_exists(obj_boss_earth_hand) )
{
	health_draw(16);	
}