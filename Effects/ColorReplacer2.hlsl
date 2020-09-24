
struct PS_INPUT
{
  float4 Tint : COLOR0;
  float2 texCoord : TEXCOORD0;
  float4 Position : SV_POSITION;
};

Texture2D<float4> source : register(t0);
sampler sourceSampler : register(s0);

cbuffer PS_VARIABLES : register(b0)
{
	float4 replaceThis1;
	float4 replaceWith1;
	float4 replaceThis2;
	float4 replaceWith2;
	float4 replaceThis3;
	float4 replaceWith3;
	float4 replaceThis4;
	float4 replaceWith4;
	float4 replaceThis5;
	float4 replaceWith5;
	float4 replaceThis6;
	float4 replaceWith6;
	float4 replaceThis7;
	float4 replaceWith7;
	float4 replaceThis8;
	float4 replaceWith8;
	float4 replaceThis9;
	float4 replaceWith9;
};

float4 ReplaceColor(float4 _color)
{
	float4 color = _color;
	if(abs(color.r - replaceThis1.r) < 1/255.0 && abs(color.g - replaceThis1.g) < 1/255.0 && abs(color.b - replaceThis1.b) < 1/255.0)
		color.rgb = replaceWith1.rgb;

	if(abs(color.r - replaceThis2.r) < 1/255.0 && abs(color.g - replaceThis2.g) < 1/255.0 && abs(color.b - replaceThis2.b) < 1/255.0)
		color.rgb = replaceWith2.rgb;

	if(abs(color.r - replaceThis3.r) < 1/255.0 && abs(color.g - replaceThis3.g) < 1/255.0 && abs(color.b - replaceThis3.b) < 1/255.0)
		color.rgb = replaceWith3.rgb;

	if(abs(color.r - replaceThis4.r) < 1/255.0 && abs(color.g - replaceThis4.g) < 1/255.0 && abs(color.b - replaceThis4.b) < 1/255.0)
		color.rgb = replaceWith4.rgb;

	if(abs(color.r - replaceThis5.r) < 1/255.0 && abs(color.g - replaceThis5.g) < 1/255.0 && abs(color.b - replaceThis5.b) < 1/255.0)
		color.rgb = replaceWith5.rgb;

	if(abs(color.r - replaceThis6.r) < 1/255.0 && abs(color.g - replaceThis6.g) < 1/255.0 && abs(color.b - replaceThis6.b) < 1/255.0)
		color.rgb = replaceWith6.rgb;

	if(abs(color.r - replaceThis7.r) < 1/255.0 && abs(color.g - replaceThis7.g) < 1/255.0 && abs(color.b - replaceThis7.b) < 1/255.0)
		color.rgb = replaceWith7.rgb;

	if(abs(color.r - replaceThis8.r) < 1/255.0 && abs(color.g - replaceThis8.g) < 1/255.0 && abs(color.b - replaceThis8.b) < 1/255.0)
		color.rgb = replaceWith8.rgb;

	if(abs(color.r - replaceThis9.r) < 1/255.0 && abs(color.g - replaceThis9.g) < 1/255.0 && abs(color.b - replaceThis9.b) < 1/255.0)
		color.rgb = replaceWith9.rgb;
	return color;
}

float4 ps_main( in PS_INPUT In ) : SV_TARGET
{
	float4 color = source.Sample(sourceSampler,In.texCoord) * In.Tint;
	color = ReplaceColor(color);
	return color;
}

float4 ps_main_pm( in PS_INPUT In ) : SV_TARGET
{
	float4 color = source.Sample(sourceSampler,In.texCoord) * In.Tint;
	if ( color.a != 0 )
		color.rgb /= color.a;
	color = ReplaceColor(color);
	color.rgb *= color.a;
	return color;
}
