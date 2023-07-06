alpha = lerp(alpha, grow, 0.02);
if ( !grow && alpha < 0.05 )
{
	instance_destroy();
}