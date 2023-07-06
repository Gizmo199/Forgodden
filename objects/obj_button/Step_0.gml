var sel = selected;
if ( !active ) selected = false;
grow = lerp(grow, selected, 0.1);

with ( obj_info_pillar ) 
{
	image_alpha = other.alpha;	
}

alpha = lerp(alpha, active, 0.05);

var m = "mouse";
with ( obj_player ) { m = mode; }

if ( active )
{
	var ldx = mouse_x;
	var ldy = mouse_y;
	if ( m != "mouse" )
	{
		var dir = point_direction(obj_player.x, obj_player.y, obj_player.aim.x, obj_player.aim.y);
		ldx = obj_player.x + lengthdir_x(64, dir);
		ldy = obj_player.y + lengthdir_y(64, dir);
	}
	if ( point_in_rectangle(ldx, ldy, bbox_left, bbox_top, bbox_right, bbox_bottom)	)
	{
		selected = true;	
		
		if ( mouse_check_button_released(mb_left) || gamepad_button_check_released(0, gp_shoulderrb) )
		{
			if ( func != -1 )
			{
				func();	
				con_audio.play_sound(snd_gateway, .5);
			}
		}
	}
	else
	{
		selected = false;
	}
}

if ( sel != selected && selected == true )
{
	con_audio.play_sound(snd_fireball_3, .5, random_range(.8, 1.25), 0, false);	
}