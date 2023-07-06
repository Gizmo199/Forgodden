if ( collision_circle(x, y, sprite_width*.5, obj_player, false, true) )
{
	if ( !triggered && can_trigger)
	{
		triggered = true;
	}
}

if ( triggered )
{
	persistent = true;
	room_goto(room_to);	
}