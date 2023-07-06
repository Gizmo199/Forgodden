depth_enable();
shadow_enable = false;
zspeed = 0;
z = -64;

phy_fixed_rotation = true;
phy_active = false;

angle = random(360);
wait = 60;
wait_set = 120;
rot_amt = 5;
rot = rot_amt;
grow_ang = 0;
zscale = 0;

speed = 10;

health_init(8, 3);

hit = false;

target = { x : x, y : y }
function tornado_draw()
{
	var num = 32;
	for ( var i=0; i<num; i++ )
	{
		var ang = (angle-(i*4));
		var val = 8 * ( i/num );
		
		var xx = x + lengthdir_x(val, ang);
		var yy = ((y-(i*zscale))+z) + lengthdir_y(val, ang);
		
		gpu_set_tex_filter(choose(1,0,0));
		var scl = (i/sprite_width)*zscale*.5;
		scl += clamp(dsin(grow_ang-(i*6))*.2, 0, 1) * ( i/num);
		scl *= ( zscale * .5 );
		
		//var col = make_color_hsv(0,0,(((i/num) / 2 ) *255));
		draw_sprite_ext(
			sprite_index, 1,
			xx, yy,
			scl, scl,
			ang, c_gray, zscale*.5
		);
	}
	gpu_set_tex_filter(false);
}

direction = point_direction(x, y, target.x, target.y);
