draw_set_alpha(white);
draw_set_color(c_white);

gpu_set_blendmode(bm_add);
draw_rectangle(0,0,gui.width,gui.height,false);
gpu_set_blendmode(bm_normal);

draw_set_alpha(1);