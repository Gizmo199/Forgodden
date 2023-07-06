if ( object_index != obj_boss_phoenix_flame )
{
	with ( target )
	{
		ignite_all();
	}
	
	state = boss_state_fly;
}