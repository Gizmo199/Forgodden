function health_init(sz,mx)
{
	///@func health_init(hitbox_diameter, health_max)
	hp_max = mx;
	hp = hp_max;
	hitbox = { x : x, y : y, size : sz }
	hdisp = 0;
	hurt = false
	
	hp_bar_max = 9;
	hp_bar_width = 1;
	hp_bar_sep = 5;
	hp_bar_ind = 0;
	hp_bar_max_w = 50;
	if ( mx > 10 )
	{
		hp_bar_max = 19;
		hp_bar_width = .5;
		hp_bar_sep = 3;
		hp_bar_ind = 1;
		hp_bar_max_w = 60;
	}
}
function health_update(_x, _y)
{
	///@func health_update(hitbox_x, hitbox_y)
	hdisp = lerp(hdisp, hurt, 0.25);
	hitbox.x = x;
	hitbox.y = y;
}
function health_draw(ww)
{
	///@func health_draw(total_width_offset)
	draw_set_alpha(hdisp);
	
	var _x = [ ww*hdisp, clamp(( hp_max * 5 ), 10, hp_bar_max_w)*hdisp ];
	_x[1] += _x[0];
	var _y = ww;
	
	draw_set_color(c_magenta);
	
	var ldx = x;
	var ldy = (y+z)-(image_number*.5);
	
	draw_line(ldx+4, ldy-4, ldx + _x[0], ldy-_y);
	draw_line(ldx+_x[0], ldy-_y, ldx+_x[1], ldy-_y);

	var xi = 0;
	var yi = 0;
	for ( var i=0; i<hp_max; i++ )
	{
		if ( ceil(hp) > i )
		{
			var xx = ldx+_x[0];
			var yy = ldy-_y;			
			draw_sprite_ext(sp_hp_bar, hp_bar_ind, xx + ( xi* hp_bar_sep), (yy-2)-(yi*9), hdisp * hp_bar_width, hdisp, 0, c_magenta, 1);
		}
		
		xi++;
		if ( xi > hp_bar_max )
		{
			xi = 0;
			yi += 1;
		}
	}
	
	draw_set_alpha(1);
}