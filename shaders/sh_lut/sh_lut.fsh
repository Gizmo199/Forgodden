varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D s_Lut;

void main()
{
    vec4 textureColor = texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 col = v_vColour * textureColor;
    float Alpha = col.a;
    float blueColor = textureColor.b * 63.0;

    vec2 quad1;
    quad1.y = floor(floor(blueColor) / 8.0);
    quad1.x = floor(blueColor) - (quad1.y * 8.0);

    vec2 quad2;
    quad2.y = floor(ceil(blueColor) / 8.0);
    quad2.x = ceil(blueColor) - (quad2.y * 8.0);

    vec2 texPos1;
    texPos1.x = (quad1.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.r);
    texPos1.y = (quad1.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.g);

    vec2 texPos2;
    texPos2.x = (quad2.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.r);
    texPos2.y = (quad2.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.g);

    vec4 newColor1 = texture2D(s_Lut, texPos1);
    vec4 newColor2 = texture2D(s_Lut, texPos2);
    vec4 newColor = mix(newColor1, newColor2, fract(blueColor));    
    
    gl_FragColor = v_vColour * vec4(newColor.rgb, Alpha);
}
