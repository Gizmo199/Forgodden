if ( !instance_exists(obj_rock_baracade) )
{
	full_fade = true;
	if ( con_camera.target != obj_player )
	{
		con_camera.target = obj_player;	
	}
}

move_alpha = lerp(move_alpha, !triggered, .05);
water_alpha = lerp(water_alpha, triggered, .05);
alpha = lerp(alpha, !full_fade, 0.05);

if ( alpha <= 0.05 )
{
	instance_destroy();	
}

with ( obj_rock_baracade )
{
	hurt = other.triggered;	
}

if ( full_fade ) { exit; }

if ( collision_rectangle(x, y, x+sprite_width, y + sprite_height, obj_player, false, true) )
{
	if ( !triggered )
	{
		if ( focal_target != noone )
		{
			con_camera.target = focal_target;	
		}
		triggered = true;
	}
}
else
{
	if ( triggered )
	{
		if ( obj_player.y < y+sprite_height*.5 )
		{
			full_fade = true;
			con_camera.target = obj_player;
		}
		else
		{
			triggered = false;
			con_camera.target = obj_player;
		}
	}
}

