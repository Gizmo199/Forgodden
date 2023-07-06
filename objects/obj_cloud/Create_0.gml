depth_enable();
z = -64;
zstart = z;
con_camera.view_bottom = 64;

image_blend = c_gray;
health_init(96, 50);

rain = con_audio.play_sound(snd_rain, 0, 1, 0, true);
audio_sound_gain(rain, 1, 1000);

wind = con_audio.play_sound(snd_tornado_wind, 0, 1, 0, true);

con_audio.play_boss_tone();
if ( !audio_is_playing(msc_drums) && room != rm_boss_to )
{
	boss_music = con_audio.play_sound_fade(msc_drums, 1, 1, 0, true, 10000);
}
con_audio.play_sound(msc_flute);
if ( audio_is_playing(msc_main) )
{
	audio_sound_gain(msc_main, 0, 0);
}

state_timer = 100;
tornado = noone;
target = { x : x, y : y }

my_speed = 0.005;

hit = false;
raining = true;

function state_tornado()
{
	hit = false;
	hurt = true;
	if ( hp < hp_max * .5 )
	{
		raining = true;
	}	
	else
	{	
		raining = false;
	}
	
	if ( room != rm_boss_to )
	{
		if ( !tornado )
		{
			tornado = instance_create_layer(x, y, layer, obj_tornado);	
			tornado.wait = 90;
		
			if ( hp < hp_max * .5 )
			{
				tornado.hp = 5;
				tornado.wait_set = 60;
			
				var xx = x + random_range(-16, 16);
				var yy = y + random_range(-16, 16);
				var ins = instance_create_layer(xx, yy, layer, obj_tornado);	
				ins.hp = 3;
				ins.shadow_enable = true;
				ins.speed = 5;
			}
		}
	}
	else
	{
		//repeat(2)
		//{
			var xx = x + random_range(-32, 32);
			var yy = y + random_range(-32, 32);
			var ins = instance_create_layer(xx, yy, layer, obj_tornado_nonwall);	
			ins.hp = 1;
			ins.shadow_enable = true;
			ins.speed = 5;	
		//}
		state_previous = state;
		state = state_lightning;
		state_timer = 100;
	}
	
	x = lerp(x, obj_player.x, my_speed);
	y = lerp(y, obj_player.y, my_speed);

	if ( tornado )
	{
		x = tornado.x;
		y = tornado.y;
	
		if ( tornado.zscale > 1.9 )
		{
			z = lerp(z, tornado.z + zstart, .1);
		}
	}
	
	var c = collision_circle(x, y, 64, obj_fireball, false, true);
	if ( c )
	{
		if ( c.z < -63 )
		{
			image_blend = c_white;
			alarm[1] = 5;
			hp--;
		
			var aud = con_audio.play_sound_at(choose(snd_fire_hit_1, snd_fire_hit_2), x, y, 32, 64);
			audio_sound_pitch(aud, random_range(.4, 1.5));
			instance_destroy(c);
		}
	}

	with ( tornado )
	{
		hit = other.image_blend == c_white;	
	}
	
	if ( tornado != noone && !instance_exists(tornado) )
	{
		tornado = noone;
		state_previous = state;
		state = state_center;
		state_timer = 100;
	}
}
function state_lightning()
{
	raining = true;
	x = lerp(x, target.x, my_speed * 10);
	y = lerp(y, target.y, my_speed * 10);
		
	if ( point_distance(x, y, target.x, target.y) < 5 )
	{
		if ( !instance_exists(obj_lightning) && !instance_exists(obj_charge) )
		{
			hurt = false;
			var charge = instance_create_layer(obj_player.x, obj_player.y, layer, obj_charge);
			if ( hp < hp_max * .5 && room != rm_boss_to )
			{
				charge.big = choose(true, true, false);	
			}
		}
		target.x = obj_player.x;
		target.y = obj_player.y;
	}
	
	
	if ( state_timer && !--state_timer )
	{
		state_previous = state;
		state = choose(state_lightning, state_tornado);
		state_timer = 100;
	}
}	
function state_center()
{
	hurt = false;
	if ( room != rm_boss_to )
	{
		x = lerp(x, room_width*.5, 0.05);
		y = lerp(y, (room_height*.5)-32, 0.05);
	}
	else
	{
		x = lerp(x, obj_player.x, 0.05);
		y = lerp(y, obj_player.y, 0.05);
	}	
	
	target.x = x;
	target.y = y;
		
	if ( state_timer && !--state_timer )
	{
		if ( room == rm_boss_to )
		{
			state = state_tornado;
			state_timer = 200;
		}
		else
		{
			state = state_lightning;
			state_timer = random_range(400, 500);
		}
	}
}

state = state_center;
state_previous = state_lightning;