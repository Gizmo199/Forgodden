draw_self();

if ( !triggered )
{
	with ( obj_player )
	{
		draw_sprite(sp_player_cursor, 0, aim.x, aim.y);
	}
}