//draw_sprite_ext(sp_light, 0, x, y, 1, 1, 0, c_maroon, .25);

with ( obj_boss_phoenix_flame )
{
	draw_sprite_ext(sprite_index, image_index, x, y, .5, 1, -90, c_black, .15);	
}

var ang = abs(image_angle) % 360;
var hover = sin(current_time/240)*2 * ( flying );
var flap = abs(dcos((current_time/4)*flying));

if ( hit ) gpu_set_fog(1,c_white,1,1);
draw_sprite_ext(sp_boss_phoenix_wings, 0, x, y+z + hover, sign(dcos(ang)) * flap, .5, 0, image_blend, 1);
draw_self_stacked(z + hover, zscale);
if ( hit ) gpu_set_fog(0,0,0,0);

with ( obj_boss_phoenix_flame )
{
	event_perform(ev_draw, 0);	
}

health_draw(true);

if ( flying )
{
	with ( target )
	{
		if ( active )
		{
			draw_set_color(c_magenta);
			draw_set_alpha(abs(current_time/200));
			draw_rectangle(bbox_left - 2, bbox_top - 2, bbox_right + 2, bbox_bottom + 2, true);	
			draw_set_alpha(1);
		}
	}	
}