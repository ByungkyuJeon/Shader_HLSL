// Base Shader

float4x4 mvp : WorldViewProjection <string UIWidget = "None"; >;

struct app2vertex
{
    float4 position : POSITION;
};

struct vertex2pixel
{
    float4 position : POSITIONT;
    float4 color : COLOR;  
};

vertex2pixel vertex(app2vertex In)
{
    vertex2pixel Out;
    Out.position = mul(In.position, mvp);
    
    return Out;
}

float4 pixel(vertex2pixel In) : COLOR
{
    float4 col = In.color;
    
    return col;
}