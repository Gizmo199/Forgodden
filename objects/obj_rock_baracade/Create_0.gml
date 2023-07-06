if ( !global._tutorial) { instance_destroy(); exit; }

depth_enable();
reflect_enable();
var xs = image_xscale;
image_xscale = xs * choose(1, -1);
image_speed = 0;

health_init(sprite_width, my_health);

can_hit = true;
flash = false;