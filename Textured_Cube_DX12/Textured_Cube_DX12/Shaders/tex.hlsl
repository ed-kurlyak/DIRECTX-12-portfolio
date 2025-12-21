Texture2D    gDiffuseMap : register(t0);

SamplerState gsamPointWrap  : register(s0);
SamplerState gsamPointClamp  : register(s1);
SamplerState gsamLinearWrap  : register(s2);
SamplerState gsamLinearClamp  : register(s3);
SamplerState gsamAnisotropicWrap  : register(s4);
SamplerState gsamAnisotropicClamp  : register(s5);


cbuffer cbPass : register(b0)
{
	float4x4 gViewProj; 
};

cbuffer cbPerObject : register(b1)
{
	float4x4 gWorld; 
};

struct VertexIn
{
	float3 PosL  : POSITION;
    float2 Tex : TEXCOORD;
};

struct VertexOut
{
	float4 PosH  : SV_POSITION;
    float2 Tex : TEXCOORD;
};


VertexOut VS(VertexIn vin)
{
	VertexOut vout;
	
	float4 Pos = mul(float4(vin.PosL, 1.0f), gWorld);

	// Transform to homogeneous clip space.
	vout.PosH = mul(Pos, gViewProj);


	vout.Tex = vin.Tex;
    
    return vout;
}


float4 PS(VertexOut pin) : SV_Target
{
	float4 ResColor =  gDiffuseMap.Sample(gsamLinearWrap, pin.Tex);

	return ResColor;
}


