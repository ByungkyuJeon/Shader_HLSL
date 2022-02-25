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

VS_OUTPUT vertex(VS_INPUT In)
{
    VS_OUTPUT Out;
    Out.position = mul(In.position, WorldViewProj);
    
    Out.color = float4(0.3, 0.3, 0.3, 1.0);
    
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