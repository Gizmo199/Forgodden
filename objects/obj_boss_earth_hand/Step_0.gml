alone = instance_number(obj_boss_earth_hand) == 1;
if ( alone )
{
	speed = lerp(speed, .07, .02);	
}
else
{
	speed = ( ( hp_max - hp ) + 1 ) * 0.01; 	
}
if ( move )
{
	hurt = false;
	hit = 0;
	sprite_index = sp_boss_earth_hand;
	
	collider.phy_active = false;
	direction -= angle_difference(direction, point_direction(x, y, obj_player.x, obj_player.y)) * .1;
	phy_speed_x = lerp(phy_speed_x, dcos(-direction)*1.5, speed);
	phy_speed_y = lerp(phy_speed_y, dsin(-direction)*1.5, speed);
	
	if ( !alone )
	{
		var cp = collision_circle(x, y, sprite_width*.5, obj_player, false, true);
		if ( cp )
		{
			slam();
		}
	}
	else
	{
		if ( round(sin(current_time/400)) == 1 )
		{
			slam();
		}
	}
}
phy_rotation = lerp(phy_rotation, rot_to, 0.1);
if ( charging && !move )
{
	var r = [ random_range(-2, 2), random_range(-2, 2) ];
	if ( alone )
	{
		r = [0, 0];
		rot_to+=90;
		
		xstart = lerp(xstart, obj_player.x, speed * .75);
		ystart = lerp(ystart, obj_player.y, speed * .75);
	}
	
	phy_position_x = xstart + r[0];
	phy_position_y = ystart + r[1];
}
var zz = -16;
if ( !charging && !move ) 
{ 
	if ( z > -2 && z < -1 )
	{
		var sz = .5;
		
		play_boss_slam();
		
		if ( alone ) sz = .25;
		var c = collision_circle(hitbox.x, hitbox.y, hitbox.size*sz, obj_player, false, true);
		if ( c )
		{
			with ( c )
			{
				player_die();	
			}
		}
		var c = collision_circle(hitbox.x, hitbox.y, hitbox.size*.5, obj_spike, false, true);
		if ( c )
		{
			hurt = true;
			sprite_index = sp_boss_earth_hand_hurt;
			alarm[1] = 100;
			if ( alone )
			{
				alarm[1] = 75;
			}
			hit = 3;
			
			xstart = phy_position_x;
			ystart = phy_position_y;
			
			instance_destroy(c);
		}
		else
		{
			if ( alone )
			{
				move = true;
				charging = false;
				
				if ( round(sin(current_time/400)) == 1 )
				{
					if ( instance_number(obj_rock_small) < 5 )
					{
						var i = 0;
						repeat(2)
						{
							var d = random(360);
							var l = random_range(32, 96);
							var xx = x + (dcos(d)*l);
							var yy = y + (dsin(d)*l);
							var ins = instance_create_layer(xx, yy, layer, obj_rock_small);	
							
							if ( i ) ins.wait = 10;							
							i++;							
						}
					}
				}
			}
		}
		phy_speed_x = 0;
		phy_speed_y = 0;
		screen_shake(5);
		collider.phy_active = true;
		z = -.9;
	}
	zz= 0; 
}

z = lerp(z, zz, 0.3);

collider.phy_position_x = phy_position_x;
collider.phy_position_y = phy_position_y;
collider.phy_rotation = phy_rotation;
collider.can_kill = !hurt;

health_update(x, y-image_number*.5);
if ( hurt )
{
	var c = collision_circle(hitbox.x, hitbox.y, hitbox.size*.5, obj_hitter, false, true);
	if ( c )
	{
		if ( c.grow > .5 && !hit )
		{
			c.image_blend = c_orange;
			c.alarm[0] = 2;
			
			if ( c.object_index == obj_fireball )
			{
				play_fire_hit();
			}
			
			if ( hit ) exit;

			hit = 1;	
		
			hp-=c.damage;
			
			if ( c.object_index == obj_fireball )
			{
				instance_destroy(c);	
			}
		}
	}
}
if ( hit ) { hit -= 0.1; }

if ( hp <= 0 )
{
	instance_destroy();	
}

if ( (alarm_get(1) > 0 && alarm_get(1) < 20 ) && hurt )
{
	phy_position_x = xstart + random_range(-1, 1);
	phy_position_y = ystart + random_range(-1, 1);
}