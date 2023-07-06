if ( global._finalBoss ) { instance_destroy(); exit; }

var ins = instance_create_layer(0,0,layer,obj_boss_title);
ins.image_index = 4;

ins = instance_create_layer(0,0,layer,obj_flash);
ins.white = 0.1;
ins.pause_player = false;

depth_enable();
health_init(4, 1);

hp_actual = 4;
spawned = noone;

laser_amt = 0;
laser_wait = 100;

audio_stop_sound(msc_main);
drums = con_audio.play_sound(msc_drums, 1, 1, 0, true);
hhats = con_audio.play_sound(msc_hihats, 1, 1, 0, true);

stop_when_in_area = false;

function dstate_boss()
{
	hurt = false;
	if ( !spawned )
	{
		switch(hp_actual)
		{
			case 3: 
				spawned = instance_create_layer(x, y, layer, obj_boss_earth);
				spawned.hp = spawned.hp_max * .5;
			break;
			
			case 2: 
				with ( obj_boss_fire_section )
				{
					instance_create_layer(x-8, y-8, layer, obj_fire_pit);
					instance_create_layer(x+8, y-8, layer, obj_fire_pit);
					instance_create_layer(x-8, y+8, layer, obj_fire_pit);
					instance_create_layer(x+8, y+8, layer, obj_fire_pit);
			
					instance_create_layer(x, y, layer, obj_boss_fire_section);
					instance_destroy();
				}
				spawned = instance_create_layer(x, y, layer, obj_boss_fire);
				spawned.hp = 3;
			break;
			
			case 1: 
				spawned = instance_create_layer(x, y, layer, obj_cloud);
				spawned.hp = 5;
			break;
		}
	}
	else
	{
		var pd = point_direction(obj_player.x, obj_player.y, x, y);
		x = lerp(x, obj_player.x + lengthdir_x(64, pd), .08);
		y = lerp(y, obj_player.y + lengthdir_y(64, pd), .08);
		z = lerp(z, -32 + ( sin(current_time/240)*4 ), .1 );
		
		if ( !instance_exists(spawned) )
		{
			state = dstate_idle;
			spawned = noone;
			with ( obj_boss_dg_laser )
			{
				instance_destroy();
			}	
		}
				
		if ( laser_wait && !--laser_wait )
		{
			if ( laser_amt < (6-hp_actual) )
			{
				laser_wait = 15;
				
				instance_create_layer(obj_player.x, obj_player.y, layer, obj_boss_dg_laser);
				laser_amt++;
			}
			else
			{
				laser_amt = 0;
				laser_wait = 100;	
				if ( hp_actual == 2 )
				{
					laser_wait = 200;
				}
			}
		}
	}
}	
function dstate_idle()
{
	hurt = true;
	x = lerp(x, xstart, 0.05);
	y = lerp(y, ystart, 0.05);
	z = lerp(z, -5 + ( sin(current_time/240)*4 ) * ( sprite_index != sp_doppleganger_beat ), 0.05);
	var pd = point_distance(x, y, xstart, ystart);
	var c = collision_circle(x, y, 8, obj_fireball, false, true);
	if ( c && pd < 10 )
	{
		if ( c.object_index != obj_boss_phoenix_flame )
		{
			con_audio.play_sound(snd_rock_slice_3, 1, .5, 0, false);
			hurt = true;
			hp_actual--;
			
			var ins = instance_create_layer(0,0,layer,obj_flash);
			ins.white = .25;
			ins.pause_player = false;
			
			if ( point_distance(x, y, obj_player.x, obj_player.y) < 96 )
			{
				if ( hp_actual <= 0 )
				{
					hp--;
					instance_destroy();
					global._finalBoss = true;
					with ( obj_player ) { player_win(); }
				
					if ( global._humanSaved )
					{
						instance_create_layer(x, y, layer, obj_human_ending);
					}
					else
					{
						room_goto(rm_ending);	
					}
				}
			}
		}
		state = dstate_boss;
	}
}
state = dstate_idle;