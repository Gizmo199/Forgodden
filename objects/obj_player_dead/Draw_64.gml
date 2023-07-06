if ( !triggered )
{
	draw_set_color(c_white);
	draw_set_alpha(white);
	draw_rectangle(0,0,gui.width, gui.height,false);

	draw_set_color(c_black);
	draw_set_alpha(black);
	draw_rectangle(0,0,gui.width, gui.height,false);

	draw_set_alpha(1);
}
