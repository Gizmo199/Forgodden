if ( other.state == other.pstate_dash )
{
	for ( var i=0; i<array_length(pit_id); i++ )
	{
		with ( pit_id[i] )
		{
			on = false;	
			triggered = false;
		}
		active = false;
	}
}
