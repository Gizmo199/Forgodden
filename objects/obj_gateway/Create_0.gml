if ( global._tutorial ){ visible = false; }
if ( room == rm_tutorial )
{
	sprite_index = sp_gateway;
	
	if ( !global._tutorial && !global._humanSaved )
	{
		instance_destroy();	
	}
}

triggered = false;
image_speed = 0;

var amt = 0;
if ( global._bossesBeat.earth && global._bossesBeatPrev.earth == global._bossesBeat.earth ) { amt++; }
if ( global._bossesBeat.wind && global._bossesBeatPrev.wind == global._bossesBeat.wind ) { amt++; }
if ( global._bossesBeat.fire && global._bossesBeatPrev.fire == global._bossesBeat.fire ) { amt++; }
image_index = amt;

if ( sprite_index == sp_gateway )
{
	if ( global._finalBoss )
	{
		image_index++;	
	}
}