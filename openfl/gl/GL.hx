package openfl.gl;


#if (!next && !flash && !js)
typedef GL = openfl._v2.gl.GL;
#else
typedef GL = lime.graphics.opengl.GL;
#end