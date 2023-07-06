var dis_vol = (1-point_distance(x, y, obj_player.x, obj_player.y) / 64);
audio_sound_gain(audio, on * dis_vol, 0);

can_sound = true;

if ( on || triggered )
{
	var xx = x + random_range(-2, 2);
	var yy = y + random_range(-2, 2);
	part_particles_create(psys, xx, yy-sprite_height*.6, p_type, 1);
}

var c = collision_circle(x, y, sprite_width*.5, obj_player, false, true);
if ( c )
{
	if ( !on ) exit;

	if ( c.state == c.pstate_dash )
	{
		on = false;
		
		var aud = con_audio.play_sound_at(snd_fireball_3, x, y, 32, 16);
		audio_sound_set_track_position(aud, .2);
		
		part_type_color3(p_type, c_orange, c_gray, c_ltgray);
		part_type_size(p_type, .05, .2, 0, 0);
	}
	elif ( collision_circle(x, y, sprite_width*.2, obj_player, false, true) )
	{	
		if ( c.state != c.pstate_hit )
		{
			if ( !c.paused )
			{
				screen_shake(5);
		
				if ( can_sound )
				{
					var aud = con_audio.play_sound_at(snd_human_die, x, y, 100, 64);
					audio_sound_pitch(aud, 1);
					with ( obj_fire_pit ) can_sound = false;
				}
				with ( c )
				{
					player_hit();	
				}
			}
		}
	}
}
c = collision_circle(x, y, sprite_width*.4, obj_raindrop, false, true);
if ( c )
{
	on = false;
		
	var aud = con_audio.play_sound_at(snd_fireball_3, x, y, 32, 16);
	audio_sound_set_track_position(aud, .2);
		
	part_type_color3(p_type, c_orange, c_gray, c_ltgray);
	part_type_size(p_type, .05, .2, 0, 0);
}

c = collision_circle(x, y, sprite_width*.4, obj_fireball, false, true);
if ( c )
{
	if ( !on && !triggered && c.z >= -2 )
	{
		alarm[0] = 50;
		triggered = true;
		instance_destroy(c);
		
		var aud = con_audio.play_sound_at(snd_fireball_3, x, y, 16, 32);
		audio_sound_pitch(aud, 3);
	}	
}

c = collision_circle(x, y, sprite_width, obj_tornado, false, true);
if ( c && on && active )
{
	if ( irandom_range(-10, 1) )
	{
		var ins = instance_create_layer(x, y-6, layer, obj_fireball);
		ins.target = c;
		ins.damage = .25;
		active--;
		if ( ! active )
		{
			alarm[1] = 50;
		}
	}
}
with ( light )
{
	var ran = [ .05, .1 ];
	if ( room == rm_boss_fire )
	{
		ran = [.01, .03 ];
	}	
	image_alpha = lerp(image_alpha, random_range(ran[0], ran[1]) * other.on, 0.2);
	image_blend = c_magenta;
}	