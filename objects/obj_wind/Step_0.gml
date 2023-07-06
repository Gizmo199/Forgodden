tail = lerp(tail, 1, spd);
if ( tail >= .99 )
{
	head = lerp(head, 1, spd);	
}
if ( head >= .99 )
{
	instance_destroy();	
}