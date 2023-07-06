alpha = lerp(alpha, !triggered, 0.05);

if ( triggered && alpha <.05 )
{
	instance_destroy();
}

if ( keyboard_check(vk_anykey) || mouse_check_button(mb_any) )
{
	triggered = true;
	alarm[0] = -1;
}
for ( var i=0; i<16; i++ )
{
	if ( gamepad_button_check(0, i) )
	{
		alarm[0] = -1;
		triggered = true;
	}
}
image_alpha = alpha;