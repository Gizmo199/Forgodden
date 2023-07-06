hurt = can_hit;

var turn_speed = .01;
if ( instance_exists(obj_boss_earth_hand) ) 
{ 
	can_hit = false; 
	phy_active = false;
	phy_speed_x = 0;
	phy_speed_y = 0;
	
	var pd = clamp(point_distance(obj_player.x, obj_player.y, room_width*.5, room_height*.5), 64, room_width);
	var dir = point_direction(obj_player.x, obj_player.y, room_width*.5, room_height*.5);
	phy_position_x = lerp(phy_position_x, ( room_width * .5 ) + dcos(-dir)*pd, 0.01);
	phy_position_y = lerp(phy_position_y, ( room_height* .5 ) + dsin(-dir)*pd, 0.01);
	
	turn_speed = .1;
	
	phy_rotation = -direction;
}

direction -= angle_difference(direction, point_direction(x, y, obj_player.x, obj_player.y)) * turn_speed;
health_update(x, y-image_number*.5);

var c = collision_circle(hitbox.x, hitbox.y, hitbox.size*.5, obj_hitter, false, true);
if ( c )
{
	if ( c.object_index != obj_boss_phoenix_flame )
	{
		if ( c.grow > .5 && !hit && can_hit )
		{
			c.image_blend = c_orange;
			c.alarm[0] = 2;
			if ( c.object_index == obj_fireball )
			{
				play_fire_hit();
			}
		
			if ( hit ) exit;

			alarm[0] = 5;
			hit = true;	
		
			var h = hp;
			hp-=c.damage;
		
			if ( hp <= 0 && h != hp )
			{
				with ( obj_player )
				{
					player_win();	
				}
			}

			instance_destroy(c);	
		}
	}
}
if ( hp <= 0 ) { can_hit = false; }
if ( !instance_exists(obj_boss_earth_hand) && !can_hit )
{
	phy_rotation += timer*.5;
	timer++;
	var zz = -32;
	var spd = .15;
	var tamt = clamp(hp*2.5, 35, 60);
	//if ( hp < 1 ) tamt = 0;
	if ( timer > tamt )
	{
		zz = 0;
		spd = .5;
		
		target.x = obj_player.x;
		target.y = obj_player.y;
	}
	else
	{
		var spd = .05;
		if ( hp < hp_max*.3 ) { spd = .1 }
		phy_position_x = lerp(phy_position_x, target.x, spd);
		phy_position_y = lerp(phy_position_y, target.y, spd);
		
		phy_active = false;
	}
	z = lerp(z, zz, spd);
	if ( z > -0.2 )
	{
		play_boss_slam();
		timer = 0;
		if ( hp > 0 )
		{
			screen_shake(5);
		}
		else
		{
			if ( irandom_range(-2, 1) )
			{
				screen_shake(3);	
			}
		}	
		if ( !instance_exists(obj_rock_big) )
		{
			var rep = 1;
			if ( hp > (hp_max*.3) ) rep = 2;
			repeat(rep)
			{
				var xx = random_range(con_render.bbox_left, con_render.bbox_right);
				var yy = random_range(con_render.bbox_top, con_render.bbox_bottom);
				instance_create_layer(xx, yy, layer, obj_rock_big);				
			}
		}
		
		var rep = 2;
		if ( hp <= 0 ) rep = irandom_range(-4, 1) == 1;
		repeat(rep)
		{
			var xx = random_range(con_render.bbox_left, con_render.bbox_right);
			var yy = random_range(con_render.bbox_top, con_render.bbox_bottom);
			var ins = instance_create_layer(xx, yy, layer, obj_rock_small);			
			ins.can_kill = rep-1;
			
			if ( hp <= 0 ) ins.ever_kill = false;
		}
		
		if ( hp > 0 )
		{
			var c = collision_circle(hitbox.x, hitbox.y, hitbox.size*.5, obj_player, false, true);
			if ( c )
			{
				with ( c )
				{
					player_die();	
				}
				exit;
			}
		}
		
		var c = collision_circle(x, y, sprite_width*.5, obj_spike, false, true);
		if ( c )
		{
			can_hit = true;
			alarm[1] = 150;
			if ( hp < (hp_max*.5) )
			{
				alarm[1] = 100;
			}
			phy_active = true;
			
			xstart = phy_position_x;
			ystart = phy_position_y;
		}	
		
		phy_active = true;
	}
}
if ( can_hit && alarm_get(1) < 30 )
{
	phy_position_x = xstart + random_range(-2, 2);
	phy_position_y = ystart + random_range(-2, 2);
}

if ( hp <= 0 )
{
	con_render.whiteout += 0.0025;
	
	repeat(irandom_range(-2, 1))
	{
		var ins = instance_create_layer(x+random_range(-16,16), y+random_range(-16, 16), layer, obj_explosion_poof);
		ins.scale = random_range(1, 1.5);
	}	
}