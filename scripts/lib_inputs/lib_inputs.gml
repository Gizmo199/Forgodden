global.input_active = true;

// Inputs
function input_system() constructor
{
	device = 0;
	deadzone = .25;
	
	gamepad_set_axis_deadzone(device, deadzone);
	if ( argument_count > 0 ) device = argument[0];
	
	map = ds_map_create();
	
	static add_action = function(name, key, pad)
	{
		///@func add_action(button_name, keycode, padcode)
		map[? name] = [ key, pad ];
		return self;
	}
	static remove_action = function(name)
	{
		///@func remove_action(button_name)
		ds_map_delete(map, name);	
	}
	
	static set_device		=function(de,dz){ device = de; gamepad_set_axis_deadzone(device, dz); }
	
	static get_arrows_h		=function(){return keyboard_check(vk_right) - keyboard_check(vk_left)}
	static get_arrows_v		=function(){return keyboard_check(vk_down) - keyboard_check(vk_up)}
	static get_wasd_h		=function(){return keyboard_check(ord("D")) - keyboard_check(ord("A"));}
	static get_wasd_v		=function(){return keyboard_check(ord("S")) - keyboard_check(ord("W"));}
	static get_axis_lh		=function(){return gamepad_axis_value(device, gp_axislh);}
	static get_axis_lv		=function(){return gamepad_axis_value(device, gp_axislv);}
	static get_axis_rh		=function(){return gamepad_axis_value(device, gp_axisrh);}
	static get_axis_rv		=function(){return gamepad_axis_value(device, gp_axisrv);}
	static get_pad_h		=function(){return gamepad_button_check(device, gp_padr) - gamepad_button_check(device, gp_padl); }
	static get_pad_v		=function(){return gamepad_button_check(device, gp_padd) - gamepad_button_check(device, gp_padu); }
							
	static horizontal		=function(){return get_arrows_h()+get_wasd_h()+get_axis_lh()+get_pad_h(); }
	static vertical			=function(){return get_arrows_v()+get_wasd_v()+get_axis_lv()+get_pad_v(); }
	
	static axis_lstrength	=function(){return point_distance(0,0,horizontal(),vertical()); }
	static axis_rstrength	=function(){return point_distance(0,0,get_axis_rh(),get_axis_rv()); }
	static axis_ldir		=function(){return point_direction(0,0,horizontal(), vertical()); }
	static axis_rdir		=function(){return point_direction(0,0,get_axis_rh(),get_axis_rv());}
	
	static action_hold = function(n)
	{
		var ipt = 0;
		var m0 = map[? n][0];
		if ( m0 != undefined )
		{
			if ( m0 == keyboard_key )
			{
				ipt = keyboard_check(m0);
			}
		
			if ( m0 == mb_right || m0 == mb_left || m0 == mb_middle )
			{
				ipt = mouse_check_button(map[?n][0]);
			}
		}
		return ipt + ( !is_undefined(map[?n][1]) ? gamepad_button_check(device, map[?n][1]) : 0 );
	}
	static action_pressed = function(n)
	{
		var ipt = 0;
		var m0 = map[? n][0];
		if ( m0 != undefined )
		{
			if ( m0 == keyboard_key )
			{
				ipt = keyboard_check_pressed(map[?n][0]);
			}
		
			if ( m0 == mb_right || m0 == mb_left || m0 == mb_middle )
			{
				ipt = mouse_check_button_pressed(map[?n][0]);
			}
		}
		return ipt + ( !is_undefined(map[?n][1]) ? gamepad_button_check_pressed(device, map[?n][1]) : 0 );
	}
	static action_released = function(n)
	{
		var ipt = 0;
		var m0 = map[? n][0];
		if ( m0 != undefined )
		{
			if ( m0 == keyboard_key )
			{
				ipt = keyboard_check_released(map[?n][0]);
			}
		
			if ( m0 == mb_right || m0 == mb_left || m0 == mb_middle )
			{
				ipt = mouse_check_button_released(map[?n][0]);
			}
		}
		return ipt + ( !is_undefined(map[?n][1]) ? gamepad_button_check_released(device, map[?n][1]) : 0 ); 
	}
}
