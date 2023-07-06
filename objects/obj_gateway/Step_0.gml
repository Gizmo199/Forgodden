if ( global._bossesBeatPrev.earth != global._bossesBeat.earth )
|| ( global._bossesBeatPrev.wind  != global._bossesBeat.wind )
|| ( global._bossesBeatPrev.fire  != global._bossesBeat.fire )
{
	if ( !triggered )
	{
		triggered = true;
		alarm[2] = 30;
	}
}

if ( alarm_get(0) > 0 )
{
	screen_shake(clamp(60 - alarm_get(0), 0, 1)*.25);
}