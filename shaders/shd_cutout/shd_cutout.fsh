varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float LUM;
void main()
{
    vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float l = ( col.r+col.g+col.b ) / 3.;
	if ( l == LUM )
	{
		col.a = 0.;	
	}
	gl_FragColor = col;
}
