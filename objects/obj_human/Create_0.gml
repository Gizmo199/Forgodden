if ( !global._tutorial ) { 
	instance_destroy(obj_gate);
	instance_destroy(); 
	exit; 
}
if ( global._finalBoss )
{
	instance_create_layer(x, y, layer, obj_human_ending);
}	

depth_enable();
health_init(16, .1);

triggered = false;
start_timer = false;

hbeat = con_audio.play_sound(snd_human_heartbeat, 0, 1, 0, true);