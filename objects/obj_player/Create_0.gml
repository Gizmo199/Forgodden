global._startpos.x = x;
global._startpos.y = y;

// Rendering
depth_enable();
reflect_enable();

// Room control
room_to = room;

// Camera
cam = instance_create_layer(x, y, layer, con_camera);
cam.target = id;

// Animation
sprite = sp_player_idle;
index = 0;

// Hit
hit = false;

phy_fixed_rotation = true;

// Inputs
input = new input_system();
with ( input )
{
	add_action("Fire", mb_left, gp_shoulderrb);
	add_action("Water", vk_space, gp_shoulderlb);
	add_action("Earth", mb_right, gp_shoulderr);
	add_action("Wind", vk_shift, gp_shoulderl);
}
mouse_previous = { x : mouse_x, y : mouse_y };

// Physics
move_dir = direction;
friction = .4;
speed = .75;
function player_move_to_speed(dir, spd)
{
	phy_speed_x = lerp(phy_speed_x, dcos(-dir)*spd, friction);
	phy_speed_y = lerp(phy_speed_y, dsin(-dir)*spd, friction);
}

// State machine
aim = { x : x, y : y }
trigger_timer = 1;
trigger_timer_reset = 12;
can_change = true;

mode = "mouse";
state_init = false;
state_timer = 2;
state_dur = 
{
	dash : 20,
	wind : 5
}

dash_speed = 4;

function stimer_init()
{
	if ( state_timer == -1 )
	{
		var si = state_init;
		state_init = false;
		return si;
	}
	state_timer--;
	
	if ( state_timer == 0 )
	{
		state = state_previous;
	}
	
	var si = state_init;
	state_init = false;
	
	return si;
}
function state_change(newstate)
{
	///@func state_change(newstate, *time)
	var st = -1;
	if ( argument_count > 1 ) st = argument[1];
	
	trigger_timer = 1;
	state_previous = state;
	state = newstate;
	state_init = true;	
	state_timer = st;
}

function pstate_move()
{
	can_change = true;
	if ( global._humanSaved )
	{
		if ( instance_exists(obj_alternate_ending_effects) && !instance_exists(obj_boss_doppleganger) )
		{
			can_change = false;	
		}
	}
	else
	{
		if ( instance_exists(obj_alternate_ending_effects) )
		{
			can_change = false;	
		}
	}
	var _dash = input.action_pressed("Water");
	_dash += keyboard_check_pressed(vk_numpad0);
	
	var move = input.axis_lstrength();
	if ( abs(move) > 0 )
	{
		move_dir = input.axis_ldir();	
		audio_sound_gain(walk_audio, 1, 100);
	}
	else
	{
		move_dir = direction;
		audio_sound_gain(walk_audio, 0, 100);
	}
		
	direction = point_direction(x, y, aim.x, aim.y);
	
	// Move player
	player_move_to_speed(move_dir, speed * move);

	// Animation
	// xscale
	var xd = sign(dcos(direction));
	if ( abs(xd) != 0 )
	{
		image_xscale = xd;
	}
	if ( phy_speed > .25 )
	{	
		sprite = sp_player_run;
	}
	else
	{
		sprite = sp_player_idle;
	}	
	
	// Shoot fireballs
	if ( input.action_hold("Fire") && can_change )
	{
		if ( trigger_timer && !--trigger_timer )
		{
			trigger_timer = trigger_timer_reset;
			var f = instance_create_layer(x, y - 8, layer, obj_fireball);
			var pd = direction;
			for ( var i=0; i<room_width; i+=32 )
			{
				var c = collision_circle(x + dcos(direction)*i, y - dsin(direction)*i, 16, obj_enemy, false, true);
				if ( c && c.hurt )
				{
					pd = point_direction(x, y, c.x, c.y);
					break;
				}
			}
			var d = direction;
			if ( abs(angle_difference(direction, pd)) < 45 )
			{
				d = pd;
			}
			f.direction = d;
		}
	}	
	else
	{
		trigger_timer = 1;
	}	
	
	// Wind
	ignore 
	{
		if ( input.action_pressed("Wind") )
		{
			state_change(pstate_wind, state_dur.wind);	
		}
	}
	
	// State change
	if ( _dash && can_change )
	{
		state_change(pstate_dash, state_dur.dash);
	}
	if ( input.action_pressed("Earth") && !instance_exists(obj_spike) && can_change )
	{
		state_change(pstate_ground);
		con_audio.play_sound(snd_rock_attack);
	}
}
function pstate_dash()
{
	if ( stimer_init() )
	{
		phy_speed_x = dcos(-move_dir)*speed*dash_speed;
		phy_speed_y = dsin(-move_dir)*speed*dash_speed;
	}
	
	if ( state_timer <= 0 )
	{
		state_change(pstate_move);	
	}
	
	var xd = sign(dcos(move_dir));
	if ( abs(xd) != 0 )
	{
		image_xscale = xd;
	}
	
	with ( con_render )
	{
		if ( !surface_exists(water_surf) ) exit;
		surface_set_target(water_surf);
		with ( other )
		{
			draw_sprite_ext(sp_puddle_maker, irandom(3), x, y, random_range(.75, 1.5), random_range(.5, 1.25), random(360), c_white, 1);
		}
		surface_reset_target();
	}
	
	if ( input.action_pressed("Earth") && !instance_exists(obj_spike) )
	{
		state_change(pstate_ground);
	}
	
	sprite = sp_player_dash;
}
function pstate_wind()
{
	player_move_to_speed(direction, 0);
	if ( !input.action_hold("Wind") )
	{
		state_change(pstate_move);	
	}
		
	if ( irandom_range(-5, 1) )
	{
		var rr = random_range;
		var d = round(direction/45)*45;
		var w = instance_create_layer(x+dcos(d+rr(-45,45))*rr(8,16), (y-dsin(d+rr(-45,45))*rr(8,16))-8, layer, obj_wind);
		w.length = random_range(5, 50);
		w.spd = random_range(.25, .4);
		w.direction = d;
	}
	
	sprite = sp_player_wind;
}
function pstate_ground()
{
	if ( stimer_init() )
	{
		phy_speed_x = 0;
		phy_speed_y = 0;
		index = 0;
		
		if ( global._reward.earth.got )
		{
			index = sprite_get_number(sprite)+1;	
		}
	}	
	
	sprite = sp_player_stomp;
	
	if ( index > sprite_get_number(sprite) )
	{
		var order = [ 
			[ 1, 2, 3 ],
			[ 1, 3, 2 ],
			[ 2, 1, 3 ],
			[ 2, 3, 1 ],
			[ 3, 1, 2 ],
			[ 3, 2, 1 ]
		];
		var o = order[choose(irandom_range(0, array_length(order)-1))];
		for ( var i=0; i<4; i++ )
		{
			var ldx = lengthdir_x(i * 24, direction);
			var ldy = lengthdir_y(i * 24, direction);
			var ins = instance_create_layer(x+ldx, y+ldy, layer, obj_spike);
			ins.alarm[0] = clamp(i*5, 1, 30);
			
			var sl3 = [ snd_rock_slice_1, snd_rock_slice_2, snd_rock_slice_3 ];
			if ( i < 3 )
			{
				ins.sound_id = sl3[ o[i] - 1 ];
			}
			else
			{
				ins.sound_id = snd_rock_slice_3;
			}
		}
		state_change(state_previous);
		
		screen_shake(3);
	}
}
function pstate_hit()
{
	sprite = sp_player_hit;
	
	if ( stimer_init() )
	{
		index = 0;
		
		phy_speed_x = 0;
		phy_speed_y = 0;
		
		cam.zoom = state_timer;
		cam.red = true;
	}
	
	if ( state_timer < 2 )
	{
		if ( room != rm_boss_wind && room != rm_boss_fire )
		{
			phy_position_x = global._startpos.x;
			phy_position_y = global._startpos.y;	
		}
		else
		{
			phy_position_x = (room_width * .5)+4;
			phy_position_y = (room_height * .5) + 16;
		}
		
		state_change(pstate_move);
		state_previous = pstate_move;
		
		cam.red = false;
	}
	
	if ( index > sprite_get_number(sp_player_hit)-2 )
	{
		index = sprite_get_number(sp_player_hit)-1;	
	}
}
function pstate_pause()
{
	phy_speed_x = 0;
	phy_speed_y = 0;
	
	sprite = sp_player_idle;
	
	audio_sound_gain(walk_audio, 0, 0);
	audio_sound_gain(water_audio, 0, 0);	
	
	if ( !paused ) { state_change(pstate_move); }
}

function pstate_endwalk()
{
	if ( global._humanSaved )
	{
		phy_speed_x = 0;
		phy_speed_y = speed*.75;
	}
	else
	{
		phy_speed_x = dcos(point_direction(x, y, obj_gateway.x, obj_gateway.y))*(speed*.5);
		phy_speed_y = -speed * .5;	
	}
	sprite = sp_player_run;
}

state = pstate_move;
state_previous = state;

function player_die()
{
	//if ( room != rm_boss_to )
	//{
		var cx = cam.view_x - cam.view_width*.5;
		var cy = cam.view_y - cam.view_height*.5;
		var ins = instance_create_depth(x - cx, y - cy, 0, obj_player_dead);
		ins.image_xscale = image_xscale;
		ins.room_to = room_to;
	
		con_audio.play_sound(snd_die, .5);
		room_goto(rm_die);
	//}
}
function player_win()
{
	if ( !instance_exists(obj_boss_doppleganger) )
	{
		con_audio.play_sound(snd_win, .5);	
		instance_create_layer(0,0,layer, obj_flash);
	
		switch(room)
		{
			case rm_boss_earth:
				global._bossesBeat.earth = true;
				global._reward.earth.earned = true;
				
				var ins = instance_create_layer(room_width*.5, (room_height*.5)-16, layer, obj_reward);
				ins.image_index = 0;
			break;
			case rm_boss_wind: 
				global._bossesBeat.wind = true; 
				global._reward.water.earned = true;
				
				var ins = instance_create_layer(room_width*.5, (room_height*.5)-16, layer, obj_reward);
				ins.image_index = 2;
			break;
			case rm_boss_fire: 
				global._bossesBeat.fire = true; 
				global._reward.fire.earned = true;
				
				var ins = instance_create_layer(room_width*.5, (room_height*.5)-16, layer, obj_reward);
				ins.image_index = 1;
			break;
		}	
	
		with ( obj_gate )
		{
			instance_destroy();
		}
	
		with ( obj_hitter )
		{
			instance_destroy();	
		}
		
		paused = true;
	}
	else
	{
		var fl = instance_create_layer(0,0,layer, obj_flash);	
		fl.white = .75;
		fl.pause_player = false;
	}
	
	save_game();
}
function player_hit()
{
	if ( !paused )
	{
		state_change(pstate_hit, 50);
	}
}
function silhouette_draw_update()
{
	gpu_set_blendenable(0);
	gpu_set_colorwriteenable(0,0,0,1);

	var spr = 
	{
		xoff	: sprite_get_xoffset(sprite),
		yoff	: sprite_get_yoffset(sprite),
		width	: sprite_get_width(sprite),
		height	: sprite_get_height(sprite)
	}
	var xx = x - spr.xoff;
	var yy = y - spr.yoff;

	draw_set_alpha(0);
	draw_rectangle(xx, yy, xx+spr.width, yy+spr.height, false);
	draw_set_alpha(1);

	gpu_set_blendenable(1);
	gpu_set_colorwriteenable(1,1,1,1);
}
function silhouette_draw()
{
	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
	gpu_set_alphatestenable(true);
	
	gpu_set_fog(1, c_yellow, 0, 1);
	draw_sprite_ext(sprite, index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	gpu_set_fog(0,0,0,0);	
	
	gpu_set_alphatestenable(false);
	gpu_set_blendmode(bm_normal);
}

walk_audio = con_audio.play_sound(snd_walk, 0, 1, 0, true);
water_audio = con_audio.play_sound(snd_water_skid, 0, 1, 0, true);

paused = false;
if ( room == rm_intro )
{
	paused = true;
	cam.fade_speed = .01;
}