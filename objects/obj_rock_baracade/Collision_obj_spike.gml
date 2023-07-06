if ( !can_hit ) exit;
hp-=other.damage;
instance_destroy(other);

can_hit = false;
flash = true;
alarm[0] = 5;

if ( hp <= 0 )
{
	instance_destroy();	
}
else
{
	con_audio.play_sound_at(choose(snd_fire_hit_1, snd_fire_hit_2), x, y, 100, 64);	
}