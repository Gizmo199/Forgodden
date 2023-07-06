if ( hit ) gpu_set_fog(true, c_white, 1, 1);
tornado_draw();
if ( hit ) gpu_set_fog(0, 0, 0, 0);

health_draw(16);
