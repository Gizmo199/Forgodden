global.__gui = 
{
	width : display_get_gui_width(),
	height: display_get_gui_height(),
	center : { x : display_get_gui_width() *.5, y : display_get_gui_height()*.5 },
	
	set_size : function(w,h)
	{
		///@func set_size(width, height)
		display_set_gui_size(w,h);
		width = w;
		height = h;
		center = { x : w*.5, y : h*.5 };
	}
}
global.__window = 
{
	fullscreen : false,
	center:
	{ 
		x : window_get_width() * .5, 
		y : window_get_height() * .5 
	},
	width : window_get_width(),
	height: window_get_height(),
	
	set_size : function(w,h)
	{
		///@func set_size(width, height, *fullscreen)
		if ( argument_count > 2 ) { fullscreen = argument[2]; }
		var ww, hh;
		ww = w;
		hh = h;
		
		if ( fullscreen )
		{
			ww = display.width;
			hh = display.height;
		}
		
		window_set_size(ww,hh);
		width = ww;
		height = hh;
		center = { x : ww*.5, y: hh*.5 };
		
		window_set_position(
			display.center.x - center.x,
			display.center.y - center.y
		);		
	}
}
global.__display = 
{
	width : display_get_width(),
	height: display_get_height(),
	center : { x : display_get_width()*.5, y : display_get_height()*.5 }
}
#macro gui		global.__gui
#macro window	global.__window
#macro display	global.__display