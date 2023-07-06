draw_set_color(choose(c_white, c_aqua));
draw_set_alpha(random_range(.1, .5));
draw_line(x, y, x, obj_cloud.y + obj_cloud.z);
draw_set_alpha(1);