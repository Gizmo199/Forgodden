if ( whiteout > 0.01 )
{
	gpu_set_blendmode(bm_add);
	draw_set_color(c_white);
	draw_set_alpha(whiteout);
	draw_rectangle(0,0,gui.width, gui.height, false);
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);
}