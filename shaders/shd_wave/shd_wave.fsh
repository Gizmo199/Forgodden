varying vec2 v_texcoord;

uniform float time;
float wave_amount = 1.;
float wave_distortion = 1.;
float wave_speed = 1.;

void main()
{ 
    vec2 uv = v_texcoord;
    uv.x = uv.x+cos(uv.y*wave_amount+time*wave_speed)/wave_distortion;
    uv.y = uv.y+sin(uv.x*wave_amount+time*wave_speed)/wave_distortion;
 
    gl_FragColor = texture2D(gm_BaseTexture,uv);
}
