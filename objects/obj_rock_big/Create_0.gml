depth_enable();
reflect_enable();

z = -((room_height*.75)+random(room_height*.25));
zstart = z;
zspeed = 0;

first_hit = false;

image_speed = 0;
image_index = choose(0,1);

var scl = random_range(.75, 1.25);
image_xscale = scl;
image_yscale = scl;

phy_active = false;

image_alpha = 2;

can_kill = 2;
ever_kill = true;