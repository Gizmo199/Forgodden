if ( !laser )
{
	draw_set_color(c_black);
	draw_circle(x, y, 10, false);
	
	draw_set_color(c_magenta);
	draw_set_alpha(1);
	draw_circle(x, y, grow * 8, false);
	draw_circle(x, y, 8, true);
}
else
{
	if ( grow > 0.1 )
	{
		draw_set_color(c_black);
		draw_line_width(x, y, x, y-room_height, (grow * 16)+2);
		draw_circle(x, y, (grow * 8)+2, false);
		
		draw_set_color(c_white);
		draw_line_width(x, y, x, y-room_height, grow * 16);	
		draw_circle(x, y, grow * 8, false);
	}
}