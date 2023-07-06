depth_enable();
reflect_enable();
zscale = 1;
z = -32;
zspeed = 0;

intro_spd = 0.025;

health_init(sprite_width, 6);

con_audio.play_boss_tone();
con_audio.play_sound(snd_phoenix);
if ( !audio_is_playing(msc_drums) && room != rm_boss_to )
{
	boss_music = con_audio.play_sound_fade(msc_drums, 1, 1, 0, true, 10000);
}
con_audio.play_sound(msc_flute);
con_camera.view_bottom = 64;

fire_audio = con_audio.play_sound(snd_fire, 0, .5, 0, true);
audio_sound_gain(fire_audio, 1, 1000);

if ( audio_is_playing(msc_main) )
{
	audio_sound_gain(msc_main, 0, 0);	
}

hit = false;
flying = false;

var num = instance_number(obj_boss_fire_section);
target = instance_find(obj_boss_fire_section, irandom_range(0, num-1));

with ( obj_fire_pit )
{
	on = true;
}

alarm[0] = 100;
alarm[1] = 5;

flame_amount = 0;
flame_wait = 100;
flame_target = obj_player;
flame_not_player = false;

function boss_state_fall()
{
	flame_not_player = true;
	flying = false;
	image_blend = c_gray;
	hurt = true;
	if ( z < 0 )
	{
		zspeed += .1;
	}
	else
	{	
		if ( z > 0 )
		{
			z = 0;
			zspeed = 0;
			screen_shake(10);
			
			con_audio.play_sound_at(choose(snd_slam_1, snd_slam_2), x, y, 100, 96);
		}
	}
	z += zspeed;
	
	with ( target )
	{
		if ( active )
		{
			other.state = other.boss_state_fly;
		}
	}
	
	var c = collision_circle(x, y, 16, obj_fireball, false, true);
	if ( c )
	{
		if ( c.object_index != obj_boss_phoenix_flame )
		{
			with ( target )
			{
				ignite_all();
				active = 4;
			}
	
			state = boss_state_fly;
			flame_wait = 5;
			
			con_audio.play_sound_at(choose(snd_fire_hit_1, snd_fire_hit_2), x, y, 100, 96);
		}
	}
	
	c = collision_circle(x, y, 32, obj_spike, false, true);
	if ( c )
	{
		with ( target )
		{
			ignite_all();
			active = 4;
		}
		alarm[1] = 10;	
		hit = true;
		hp--;
		
		instance_destroy(obj_spike);
		
		if ( hp <= 0 )
		{
			instance_destroy();
			with ( obj_player )
			{
				player_win();
			}
			exit;
		}
		else
		{
			con_audio.play_sound_at(choose(snd_explosion_1, snd_explosion_2), x, y, 100, 64);
			state = boss_state_fly;
			with ( flame_target )
			{
				if ( object_index != obj_player )
				{
					other.target = id;	
				}
			}
			if ( instance_exists(flame_target) )
			{
				with ( flame_target ) 
				{ 
					if ( object_index == obj_boss_fire_section )
					{
						active = 4; 
						ignite_all(); 
					}
				}
			}
			flame_wait = 5;
		}
	}	
	
	var num = instance_number(obj_boss_fire_section);
	flame_target = instance_find(obj_boss_fire_section, irandom_range(0, num-1));
}
function boss_state_fly()
{
	flying = true;
	image_blend = c_white;
	hurt = false;	
	
	z = lerp(z, -32, .1);
	
	if ( instance_exists(target) )
	{
		x = lerp(x, target.x, intro_spd);
		y = lerp(y, target.y, intro_spd);
	
		if ( y > 64 ) { intro_spd = .05; }

		var pd = point_distance(x, y, target.x, target.y);
		if ( pd < 3 && pd > 1 )
		{
			x = target.x;
			y = target.y;
			with ( target )
			{
				ignite_all();
			}
		}
		
		with ( target )
		{
			if ( !active )
			{
				with ( other )
				{ 
					alarm[0] = 1;	
				}
			}
		}
	}
	
	var pd = point_direction(x, y, flame_target.x, flame_target.y);	
	image_angle -= angle_difference(image_angle, pd) * .05;
	
	if ( flame_wait && !--flame_wait )
	{
		con_audio.play_boss_tone();
		flame_wait = 5;
		if ( flame_amount > 0 && flame_amount < 11 )
		{
			var ins = instance_create_layer(x, y+z, layer, obj_boss_phoenix_flame);
			ins.target = { x : flame_target.x, y : flame_target.y }
		}
	
		if ( flame_amount > 11 )
		{
			flame_amount = 0;
			
			var ins = obj_player;
			
			var all_active = 0;
			with ( obj_boss_fire_section )
			{
				if ( active )
				{
					all_active++;
				}
			}
			
			var num = instance_number(obj_boss_fire_section);
			if ( all_active != num )
			{
				var ins = instance_find(obj_boss_fire_section, irandom_range(0, num-1));
				
				while ( ins.active )
				{
					ins = instance_find(obj_boss_fire_section, irandom_range(0, num-1));
				}
			}
			
			if ( flame_not_player )
			{
				flame_target = ins;
				flame_not_player = false;
			}
			else
			{
				flame_target = choose(obj_player, ins);
			}
			
			if ( flame_target != obj_player )
			{
				flame_wait = 125;
				if ( hp < hp_max * .5 )
				{					
					var d = 0;
					var amt = irandom_range(5 - hp, 7 - hp);
					repeat(amt)
					{
						var ins = instance_create_layer(x, y+z, layer, obj_boss_phoenix_flame);
						var ran = random_range(32, 96);
						ins.target = { x : x + dcos(d) * ran, y : y + dsin(d) * ran }
						d += ( 360/amt );
					}
				}
			}
			else
			{
				flame_wait = random_range(150, 400);
				if ( hp < hp_max*.5 )
				{
					flame_wait = random_range(50, 75);	
				}
			}
			
			if ( room == rm_boss_to )
			{
				flame_target = obj_player;	
				flame_wait = 75;
			}
		}
		flame_amount++;
	}
}
state = boss_state_fly;