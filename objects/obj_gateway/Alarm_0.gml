alarm[1] = 60;
if ( global._bossesBeat.earth && global._bossesBeatPrev.earth != global._bossesBeat.earth ) { global._bossesBeatPrev.earth = global._bossesBeat.earth; }
if ( global._bossesBeat.wind && global._bossesBeatPrev.wind != global._bossesBeat.wind ) { global._bossesBeatPrev.wind = global._bossesBeat.wind; }
if ( global._bossesBeat.fire && global._bossesBeatPrev.fire != global._bossesBeat.fire ) { global._bossesBeatPrev.fire = global._bossesBeat.fire; }

var ins = instance_create_layer(x, y, layer, obj_flash);
ins.white = .2;
ins.pause_player = false;

con_audio.play_sound(snd_gateway);

image_index++;