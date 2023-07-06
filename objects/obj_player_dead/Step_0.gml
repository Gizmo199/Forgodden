white -= 0.02;

if ( white < -1 )
{
	black += 0.02;
}	

if ( white < -3 )
{
	room_goto(room_to);
	triggered = true;
}