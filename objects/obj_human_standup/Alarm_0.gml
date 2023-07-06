instance_destroy();
with ( obj_player )
{
	player_win();	
	instance_destroy(obj_tut);
	
	with ( obj_gateway )
	{
		visible = true;	
		con_camera.target = id;
		alarm[1] = 200;
	}
}
