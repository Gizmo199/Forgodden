depth_enable();
reflect_enable();

phy_fixed_rotation = true;
rot_to = 0;
speed = .05;
timer = 30;

z = 0;
zscale = 1;

charging = false;
can_hit = false;

collider = instance_create_layer(x,y,layer,obj_boss_hand_collider);

health_init(sprite_width, 20);
hit = 0;

function slam()
{
	move = false;
	alarm[0] = timer;
	if ( alone ) { alarm[0] = timer * .75; }
	charging = true;
			
	xstart = x;
	ystart = y;
		
	rot_to += 90;
}
