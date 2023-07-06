var r = rot_amt;
grow_ang+=5;
zscale = lerp(zscale, (hp>=1)*2, 0.025);

if ( zscale < .8 )
{
	phy_active = true;	
}

if ( wait <= 0 )
{
	phy_speed_x = lerp(phy_speed_x, dcos(-direction)*speed, .03);
	phy_speed_y = lerp(phy_speed_y, dsin(-direction)*speed, .03);
}
else
{
	phy_position_x = lerp(phy_position_x, target.x, 0.05);
	phy_position_y = lerp(phy_position_y, target.y, 0.05);
}

if ( wait < 40 )
{
	r += clamp(40-wait, 0, 40);
}

if ( z < 0 )
{
	zspeed += 0.1;	
	
}
else
{
	z = 0;
	zspeed = 0;
}

z += zspeed;

if ( wait == 1 )
{
	if ( hp > 0 )
	{
		target.x = obj_player.x;
		target.y = obj_player.y;
		direction = point_direction(x, y, target.x, target.y);
		
		hurt = false;
	}		
}
wait--;
rot = lerp(rot, r, 0.1);
angle+=rot * zscale * .5;

with ( con_render )
{
	if ( !surface_exists(water_surf) ) exit;
	surface_set_target(water_surf);
	with (other)
	{	
		draw_sprite_ext(
			sp_puddle_maker, 
			irandom(sprite_get_number(sp_puddle_maker)), 
			x, y,
			random_range(.5, 1.25), random_range(.5, 1.25),
			random(360), c_black, 1
		);
	}
	surface_reset_target();
}

health_update(x, y);

if ( hp <= 0 && zscale < .1 ) instance_destroy();

var c = collision_circle(x, y, 8, obj_fireball, false, true);
if ( c && hp > 0 )
{
	c.target = id;
}
