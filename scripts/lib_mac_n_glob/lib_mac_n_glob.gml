// Extended statements
#macro elif else if
#macro ignore for(;false;)
#macro defer for(;; {
#macro after ; break; })
#macro print								\
	for ( var print_value;; {				\
		show_debug_message(print_value);	\
		break;								\
	}) print_value =

// Colors
#macro c_orange $4F6CF3
#macro c_yellow $1D94F8
#macro c_magenta $5B14EE

// Saving
global._saveMap = ds_map_create();
#macro filename "Forgodden.dat"

function load_game()
{
	if ( file_exists(filename) )
	{
		global._saveMap = ds_map_secure_load(filename);
		
		var s = global._saveMap;
		global._tutorial = s[? "tut"];
		global._humanSaved = s[? "hsave"];
		global._bossesBeat =
		{
			earth : s[? "eBoss"],
			wind  : s[? "wBoss"],
			fire  : s[? "fBoss"]
		}
		global._bossesBeatPrev = 
		{
			earth : global._bossesBeat.earth,
			wind : global._bossesBeat.wind,
			fire : global._bossesBeat.fire
		}
		global._reward = 
		{
			earth	: { got : s[? "eRew_got"], earned : s[? "eRew_earn"] },
			water	: { got : s[? "wRew_got"], earned : s[? "wRew_earn"] },
			fire	: { got : s[? "fRew_got"], earned : s[? "fRew_earn"] },
		}
	}
	else
	{
		return -1;	
	}
}
function save_game()
{
	global._saveMap[? "tut"] = global._tutorial;
	global._saveMap[? "hsave"] = global._humanSaved;
		
	global._saveMap[? "eBoss"] = global._bossesBeat.earth;
	global._saveMap[? "wBoss"] = global._bossesBeat.wind;
	global._saveMap[? "fBoss"] = global._bossesBeat.fire;
		
	global._saveMap[? "eRew_got"] = global._reward.earth.got;
	global._saveMap[? "wRew_got"] = global._reward.water.got;
	global._saveMap[? "fRew_got"] = global._reward.fire.got;
	global._saveMap[? "eRew_earn"] = global._reward.earth.earned;
	global._saveMap[? "wRew_earn"] = global._reward.water.earned;
	global._saveMap[? "fRew_earn"] = global._reward.fire.earned;
	
	ds_map_secure_save(global._saveMap, filename);
}

// Progression
global._tutorial = true;
global._humanSaved = false;
global._finalBoss = false;
global._startpos = { x : 0, y : 0 }

// Bosses
enum eBOSS_TYPE
{
	EARTH,
	WIND,
	FIRE
}
global._bossType = eBOSS_TYPE.EARTH;
global._bossesBeat =
{
	earth : false,
	wind  : false,
	fire  : false
}
global._bossesBeatPrev = 
{
	earth : global._bossesBeat.earth,
	wind : global._bossesBeat.wind,
	fire : global._bossesBeat.fire
}

// Powerups
global._reward = 
{
	earth : { got : false, earned : false },
	fire  : { got : false, earned : false },
	water : { got : false, earned : false }	
}

// Initial save / load
if ( !file_exists(filename) )
{
	save_game();
}
else
{
	load_game();	
}