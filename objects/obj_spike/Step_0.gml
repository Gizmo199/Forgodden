grow = lerp(grow, can_grow, 0.3);

if ( !can_grow && grow < .05 && can_die )
{
	instance_destroy();	
}

if ( collision_circle(x, y, .5, obj_block, false, true) )
{
	instance_destroy();
}	