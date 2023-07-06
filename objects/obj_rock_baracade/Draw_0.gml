if ( !flash )
{
	draw_self();
}
else
{
	gpu_set_fog(1,c_white,1,1);
	draw_self();
	gpu_set_fog(0,0,0,0);
}
health_draw(32);