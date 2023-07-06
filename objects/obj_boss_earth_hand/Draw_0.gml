if ( hit )
{
	gpu_set_fog(1, c_white,1,1);
	draw_self_stacked(z, zscale);
	gpu_set_fog(0,0,0,0);
}
else
{
	draw_self_stacked(z, zscale);
}

health_draw(16);