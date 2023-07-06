global.__uniformMap = ds_map_create();
function __getUniform(s,n,sm)
{
	///@func __getUniform(shader_index, uniform_name, is_sampler)
	if ( is_undefined(global.__uniformMap[? s]) )
	{
		global.__uniformMap[? s] = { uniform : ds_map_create() }
	}
	if ( is_undefined(global.__uniformMap[? s].uniform[? n]) )
	{
		global.__uniformMap[? s].uniform[? n] = sm ? shader_get_sampler_index(s,n) : shader_get_uniform(s,n);
	}
	return global.__uniformMap[? s].uniform[? n];
}

function shader_set_float(n, v)
{
	///@func shader_set_float(uniform_name, value);
	var s = shader_current();
	if ( is_array(v) )
	{
		shader_set_uniform_f_array(__getUniform(s,n,false), v);
	}
	else
	{
		shader_set_uniform_f(__getUniform(s,n,false), v);
	}
}
function shader_set_vec2(n, _x, _y)
{
	///@func shader_set_vec2(uniform_name, x, y)
	shader_set_float(n, [_x, _y]);
}
function shader_set_vec3(n, _x, _y, _z)
{
	///@func shader_set_vec3(uniform_name, x, y, z)
	shader_set_float(n, [_x, _y, _z]);
}
function shader_set_vec4(n, _r, _g, _b, _a)
{
	///@func shader_set_vec4(uniform_name, r, g, b, a)
	shader_set_float(n, [_r, _g, _b, _a]);
}
function shader_set_sampler(n,t)
{
	///@func shader_set_sampler(uniform_name, texture_index);	
	var s = shader_current();
	texture_set_stage(__getUniform(s,n,true), t);
}

function shader_map_clear()
{
	ds_map_clear(global.__uniformMap);
}
function shader_map_destroy()
{
	shader_map_clear();
	ds_map_destroy(global.__uniformMap);
}