// Base Shader

float4x4 WorldViewProj : WORLDVIEWPROJ;

struct VS_INPUT
{
    float4 position : POSITION;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 color : COLOR;  
};

float4 adjustBrightness(float4 color, float brightness)
{
    float4 res = color + brightness;
    res.a = 1.0;
    return res;
}

float4 adjustContrast(float4 color, float contrast)
{
    float4 res = (color - 0.5) * contrast + 0.5;
    res.a = 1.0;
    return res;
}

VS_OUTPUT vertex(VS_INPUT In)
{
    VS_OUTPUT Out;
    Out.position = mul(In.position, WorldViewProj);
    
    Out.color = float4(0.3, 0.3, 0.3, 1.0);
    
    Out.color = adjustContrast(Out.color, 0.4);
    
    return Out;
}

float4 pixel(VS_OUTPUT In) : COLOR
{
    float4 col = In.color;
    
    return col;
}

technique Complete
{
    pass simple
    {
        VertexShader = compile vs_1_1 vertex();
        ZEnable = true;
        ZWriteEnable = true;
        CUllMode = cw;
        AlphaBlendEnable = false;
        PixelShader = compile ps_2_0 pixel();
    }
}