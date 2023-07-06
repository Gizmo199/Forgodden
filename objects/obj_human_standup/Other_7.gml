switch(sprite_index)
{
	case sp_human_standup:
		sprite_index = sp_human_standing;
		image_index = 0;
	break;
	
	case sp_human_standing:
		image_speed = 0;
		image_index = image_number-1;
		alarm[0] = 50;
	break;
}